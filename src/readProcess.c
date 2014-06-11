#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char gpath[4096];

char* readProcess( char* cmd ) {
    FILE *fp;
    int status;
    char path[1035];
    int i = 0;
    memset(gpath, 0, 4096);
    fp = popen(cmd, "r");
    if (fp == NULL) {
        printf("Failed to run command\n" );
        exit;
    }
    while (fgets(path, sizeof(path)-1, fp) != NULL) {
        printf("%s", path);
        i += strlen(path);
        if (i < 4096) {
            strcat(gpath, path);
        }
    }
    pclose(fp);
    return gpath;
}

char* readProcessQ( char* cmd, char show ) {
    FILE *fp;
    int status;
    char path[1035];
    int i = 0;
    memset(gpath, 0, 4096);
    fp = popen(cmd, "r");
    if (fp == NULL) {
        printf("Failed to run command\n" );
        exit;
    }
    while (fgets(path, sizeof(path)-1, fp) != NULL) {
        if (show) printf("%s", path);
        i += strlen(path);
        if (i < 4096) {
            strcat(gpath, path);
        }
    }
    pclose(fp);
    return gpath;
}
