/*
 * Jakefile
 * XYZRadio
 *
 * Created by Alos on May 3, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("XYZRadio", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "XYZRadio.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("XYZRadio");
    task.setIdentifier("com.xyzradio");
    task.setVersion("1.0");
    task.setAuthor("Alos");
    task.setEmail("alos @nospam@ me.com");
    task.setSummary("XYZRadio");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["XYZRadio"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "XYZRadio", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "XYZRadio", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "XYZRadio"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "XYZRadio"), FILE.join("Build", "Deployment", "XYZRadio")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "XYZRadio"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "XYZRadio"), FILE.join("Build", "Desktop", "XYZRadio", "XYZRadio.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "XYZRadio", "XYZRadio.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "XYZRadio"));
    print("----------------------------");
}
