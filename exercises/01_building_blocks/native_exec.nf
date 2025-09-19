process hello {
    input:
    val name

    exec:
    println "Hello Mr. $name"
}

workflow {
    channel.of('a', 'b', 'c') | hello
}