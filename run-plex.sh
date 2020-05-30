# Enable use of windows paths.
# https://docs.docker.com/compose/reference/envvars/#/composeconvertwindowspaths
export COMPOSE_CONVERT_WINDOWS_PATHS=true;



# Run the server
often=5              # how long to wait in seconds:  Default 10
attempts=100         # how many times to retry:      Default 30
total_time=$((often*attempts))
echo "Attempting to start plex server backed by docker. It may take some time 
for Docker Desktop to start running, so this script will retry starting plex 
every ${often} seconds, ${attempts} times. 
I.e. This script will give up after ${total_time} seconds."
until docker-compose -f docker-compose.yml up -d 2> /dev/null
do
    ((attempts--))
    if [ "$attempts" -eq 0 ]; then
        printf "\n\nMesa think mesa giving up now... Ensure that Docker Desktop is set as a startup task!\n\n"
        exit 1
    fi
    
    echo "- I'll retry ${attempts} more times..."
    sleep $often
done
printf "\n\nStarted successfully!\n"
exit 0