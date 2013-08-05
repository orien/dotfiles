var workScreen = "1920x1200";
var laptopScreen = "1440x900";

var focusITerm = slate.operation("focus", { "app" : "iTerm" });
var laptopWide = slate.operation("move", {
  "screen" : laptopScreen,
  "x"      : "screenOriginX+0",
  "y"      : "screenOriginY+0",
  "width"  : "screenSizeX-400",
  "height" : "screenSizeY"
});
var laptopNarrow = slate.operation("move", {
  "screen" : laptopScreen,
  "x"      : "screenOriginX+screenSizeX-400",
  "y"      : "screenOriginY+0",
  "width"  : "400",
  "height" : "screenSizeY"
});

var twoMonitorsLayout = slate.layout("twoMonitors", {
  "_after_"  : { "operations" : focusITerm },
  "Textual"  : { "operations" : laptopWide },
  "Messages" : { "operations" : laptopWide },
  "Tweetbot"     : { "operations" : laptopNarrow }
});

// slate.bind("1:ctrl", slate.operation("layout", { "name" : twoMonitorsLayout }));

// default the layout so it activates when I plug in my external monitor at work.
slate.default(["1920x1200","1440x900"], twoMonitorsLayout);
