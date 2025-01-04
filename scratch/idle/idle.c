#include <stdio.h>
#include <unistd.h>

int main() {
    int seconds = 0;
    while (1) {
        seconds++;
        printf("%d\n", seconds);
        fflush(stdout);  // Ensure output is immediately written
        sleep(1);
    }
    return 0;
}
