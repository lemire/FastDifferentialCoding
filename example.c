#include <stdio.h>
#include <stdlib.h>

#include "fastdelta.h"

int main() {
   uint32_t datain[] = {1,14,15,25,100};
   int N = sizeof(datain) / sizeof(uint32_t);
   printf("starting from: ");
   for(int k = 0; k < N; ++k) printf(" %d ",datain[k]);
   printf("\n");

   compute_deltas_inplace(datain,N,0);

   printf("deltas: ");
   for(int k = 0; k < N; ++k) printf(" %d ",datain[k]);
   printf("\n");

   compute_prefix_sum_inplace(datain,N,0);


   printf("recovered: ");
   for(int k = 0; k < N; ++k) printf(" %d ",datain[k]);
   printf("\n");

   // you can also, similarly, write values to another buffer with compute_deltas, and compute_prefix_sum 

}


