#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <errno.h>


void write_to_file(const char* path, const char*message){
    FILE *file = fopen(path, "w");
    if(fprintf(file,"%s",message) < 0){
         
        syslog(LOG_ERR,"Error while tring to write to file:%s\n",strerror(errno));
    }else{
        syslog(LOG_DEBUG, "Writing \"%s\" to %s", message, path);


    }
    fclose(file); 

}


int main(int argc, char* argv[]){
    openlog(NULL,LOG_PERROR,LOG_USER);

    if(argc !=3){
        syslog(LOG_ERR,"Invalid numberof inputs:%d\n",argc);
        return 1;
    }
    write_to_file(argv[1],argv[2]);

    closelog();    
    return 0; 
}
