make all
./file_creator
port=5678
clients=3
echo -e "starting gateway "
./sensor_gateway $port $clients &
sleep 3
echo -e 'starting 3 sensor nodes'
./sensor_node 15 1 127.0.0.1 $port &
sleep 2
./sensor_node 21 6 127.0.0.1 $port &
sleep 2
./sensor_node 37 2 127.0.0.1 $port &
sleep 11
killall sensor_node
sleep 30
killall sensor_gateway
