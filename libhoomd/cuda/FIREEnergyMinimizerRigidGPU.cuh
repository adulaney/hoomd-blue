/*
Highly Optimized Object-oriented Many-particle Dynamics -- Blue Edition
(HOOMD-blue) Open Source Software License Copyright 2008, 2009 Ames Laboratory
Iowa State University and The Regents of the University of Michigan All rights
reserved.

HOOMD-blue may contain modifications ("Contributions") provided, and to which
copyright is held, by various Contributors who have granted The Regents of the
University of Michigan the right to modify and/or distribute such Contributions.

Redistribution and use of HOOMD-blue, in source and binary forms, with or
without modification, are permitted, provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright notice, this
list of conditions, and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this
list of conditions, and the following disclaimer in the documentation and/or
other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of HOOMD-blue's
contributors may be used to endorse or promote products derived from this
software without specific prior written permission.

Disclaimer

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER AND CONTRIBUTORS ``AS IS''
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND/OR
ANY WARRANTIES THAT THIS SOFTWARE IS FREE OF INFRINGEMENT ARE DISCLAIMED.

IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

// Maintainer: ndtrung

/*! \file FIREEnergyMinimizerRigidGPU.cuh
    \brief Declares GPU kernel code for rigid body energy minimization on the GPU. Used by FIREEnergyMinimizerRigidGPU.
*/

#include "ParticleData.cuh"
#include "RigidData.cuh"

#ifndef __FIRE_ENERGY_MINIMIZER_RIGID_GPU_CUH__
#define __FIRE_ENERGY_MINIMIZER_RIGID_GPU_CUH__

/*! \file FIREEnergyMinimizerRigidGPU.cuh
    \brief Defines the interace to GPU kernal drivers used by FIREEnergyMinimizerRigidGPU.
*/

//! Kernel driver for zeroing velocities called by FIREEnergyMinimizerRigidGPU
cudaError_t gpu_fire_rigid_zero_v(gpu_rigid_data_arrays rdata); 


//! Kernel driver for summing over P, vsq, and asq called by FIREEnergyMinimizerRigidGPU
cudaError_t gpu_fire_rigid_compute_sum_all(const gpu_rigid_data_arrays& rdata, 
                            float* d_sum_all_Pt, 
                            float* d_sum_all_Pr);
                            
//! Kernel driver for updating the velocities called by FIREEnergyMinimizerRigidGPU
cudaError_t gpu_fire_rigid_update_v(gpu_rigid_data_arrays rdata, 
                            float alpha, 
                            float scalar_t,
                            float scalar_r);

#endif //__FIRE_ENERGY_MINIMIZER_RIGID_GPU_CUH__
