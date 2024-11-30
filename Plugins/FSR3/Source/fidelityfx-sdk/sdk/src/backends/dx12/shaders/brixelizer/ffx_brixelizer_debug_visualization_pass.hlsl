// This file is part of the FidelityFX SDK.
//
// Copyright (C) 2024 Advanced Micro Devices, Inc.
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files(the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and /or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions :
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#define FFX_WAVE 1

#define BRIXELIZER_BIND_CB_CONTEXT_INFO                             0
#define BRIXELIZER_BIND_CB_DEBUG_INFO                               1

#define BRIXELIZER_BIND_SRV_SDF_ATLAS                               0

#define BRIXELIZER_BIND_UAV_CONTEXT_BRICKS_VOXEL_MAP                0
#define BRIXELIZER_BIND_UAV_CONTEXT_BRICKS_AABB                     1
#define BRIXELIZER_BIND_UAV_DEBUG_OUTPUT                            2
#define BRIXELIZER_BIND_UAV_CONTEXT_COUNTERS                        3
#define BRIXELIZER_BIND_UAV_DEBUG_AABBS                             4
#define BRIXELIZER_BIND_UAV_CASCADE_BRICK_MAPS                      5
#define BRIXELIZER_BIND_UAV_CASCADE_AABB_TREES                      29

#include "ffx_brixelizer_callbacks_hlsl.h"
#include "ffx_brixelizer_debug_visualization.h"

#ifndef FFX_BRIXELIZER_THREAD_GROUP_WIDTH
#define FFX_BRIXELIZER_THREAD_GROUP_WIDTH 8
#endif  // #ifndef FFX_BRIXELIZER_THREAD_GROUP_WIDTH
#ifndef FFX_BRIXELIZER_THREAD_GROUP_HEIGHT
#define FFX_BRIXELIZER_THREAD_GROUP_HEIGHT 4
#endif  // FFX_BRIXELIZER_THREAD_GROUP_HEIGHT
#ifndef FFX_BRIXELIZER_THREAD_GROUP_DEPTH
#define FFX_BRIXELIZER_THREAD_GROUP_DEPTH 1
#endif  // #ifndef FFX_BRIXELIZER_THREAD_GROUP_DEPTH
#ifndef FFX_BRIXELIZER_NUM_THREADS
#define FFX_BRIXELIZER_NUM_THREADS [numthreads(FFX_BRIXELIZER_THREAD_GROUP_WIDTH, FFX_BRIXELIZER_THREAD_GROUP_HEIGHT, FFX_BRIXELIZER_THREAD_GROUP_DEPTH)]
#endif  // #ifndef FFX_BRIXELIZER_NUM_THREADS

FFX_PREFER_WAVE64
FFX_BRIXELIZER_NUM_THREADS
FFX_BRIXELIZER_EMBED_ROOTSIG_CONTENT
void CS(uint2 tid : SV_DispatchThreadID) {
    FfxBrixelizerDebugVisualization(tid);
}