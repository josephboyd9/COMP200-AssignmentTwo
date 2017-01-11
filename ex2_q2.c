#include "/home/comp200/ex2/lib_ex2.h"

/**
 * Counts from "start" to "end" (inclusive),
 * showing progress on the seven segment displays.
 **/
void count(int start, int end){
  if(start != end && 0 <= start < 100 && 0 <= end < 100){
    while(start != end){
      writessd(start);
      delay();
      if(start < end){
	start++;
      }
      else{
	start--;
      }
    }
    writessd(start);
    delay();
  }
  return;
}
