<!DOCTYPE html>
<html lang="en">
<head>
  <title>CLN2 Supplementary Figure - NEJM</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400' rel='stylesheet' type='text/css'>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">

               * {
                    font-family: 'Open Sans', sans-serif;
                    font-weight: 500;
                    font-size: 10px;
               }

               .axis path,
               .axis line {
                    fill: none;
                    stroke: black;

                    /*shape-rendering: crispEdges;*/
               }

               .axis text,
               .label {
                  font-size: 14px;
                  font-weight: 400;
                  text-anchor: middle;
               }

               .x.axis line {
                 stroke: lightgrey;
                 stroke-opacity: .5;
                 font-size: 18px;
               }

               .y.axis line {
                 stroke: lightgrey;
                 stroke-opacity: .3;
                 margin-right: 3px;
               }

               .y2.axis line {
                stroke: lightgrey;
                 stroke-opacity: .3;
                 margin-right: 3px;
                /*display: none;*/
               }

               .tick line{
                  visibility:hidden;
                  }

               .averageTitle {
                    background-color: white;
                    fill: #AAAAAA;
                    font-weight: 500;
                    font-size: 12px;
                    pointer-events: mouseover;
               }

               .text {
                    background-color: #EFF8FB;
                    position : relative;
                    margin-left: 480px;
                    margin-bottom: 600px;
                    opacity: .1;
                    z-index: 4;
                    float:right;
                    clear:both;
               }

               .title1 {
                    background-color: white;
                    fill: #000;
                    font-weight: 500;
                    font-size: 18px;
               }

               .nav_circle {
                    position: fixed;
                    z-index: 5;
               }

               .orangedot {
                    position: fixed;
               }

               .navi_circ {
                    position: fixed;
                    pointer-events: auto;
                    cursor: pointer;
                    shape-rendering: smooth;
                    fill: white;
                    stroke: black;
               }

               .tooltip {
                 text-align: center;
                 height: auto;
                 width: auto;
                 padding: 2px;
                 font: 12px sans-serif;
                 background: lightsteelblue;
                 border: 0px;
                 border-radius: 8px;
                 pointer-events: none;
                 z-index: 1;
                 cursor: pointer;
                 }
              
              .textBox1,
              .orange1 
              {
                 position: absolute;
                 height: auto;
                 width: 220px;
                 padding: 10px;
               }

               div.orange2 {
                 position: absolute;
                 /*float: right;*/
                 /*clear: both;*/
                 /*margin-left: 300px;*/
                 /*text-align: righ t;*/
                 /*top: 300px;*/
               }



              h5 {
                text-align : center;
              }

              .hlines {
                z-index: -1;
              }

              .allBubbles {
                z-index: 5;
              }

              .square {
                z-index: 50;
              }

              .title2 {
                text-align: center;
                font-size : 10px;
            }

            .navbarText,
            .bubbleText {
              pointer-events: none;

            }

            .myxaxis .tick text {
              font-size: 18px
            }


          </style>
</head>
<body>
  <!-- [if IE] -->
      <script type="text/javascript">
        // check for IE and redirect if it is
        var ua = window.navigator.userAgent;
        console.log(ua)
        var isIE = (ua.indexOf('MSIE ') > -1 ||  ua.indexOf('Trident/') > -1 || ua.indexOf('Edge/') > -1);
        if (isIE) window.location = "http://htmlpreview.github.io/?https://github.com/spjoshi/cln2SupplementGraph/blob/master/notIE_Dev_V2.aspx";
      </script>
      <!-- [endif] -->

<!-- <div class="container" style="text-align: center"><h2>CLN2 Data Visualization</h2></div> -->

<div class="constainer">
           
    <h5>Hamburg CLN2 Motor-Language (ML) Score (0-6 points): Change from Baseline Score (BL) in </br> BMN 190 Study Patients and Matched Natural History Patients over 96 Weeks</h5>
    <p class = "title2">Matched on Baseline CLN2 Score and Age within 3 months.</br>Evaluation Period: 300mg Dosing Period</p>

    <DBLContents id = "dblContents"></DBLContents>

    <script type="text/javascript" src="https://code.jquery.com/jquery-latest.js"></script>
    <script src="https://d3js.org/d3.v3.js"></script>

    <script>

      // $.getScript("DBL_V3_Dev.js");
      // debugger;

    
    // ====================================================================================

    var m = { top: 10, right: 20, bottom: 30, left: 100 };
    var WIDTH = window.innerWidth - m.left - m.right;
    var HEIGHT = window.innerHeight - m.top - m.bottom;

    var textBoxMoveDelay = 4000,
        delay = 4000

    var textBoxMoveDuration = 2000,
        duration = 2000

    var bubbleMoveDelay = 2000
    var bubbleMoveDuration = 2000

    var setSquare2, setTextBox8, setTextBox19, setSquare3, setLinesFc, showBubbleTextVar;

    var bigScreen = window.innerWidth > 780
    
    if(window.innerHeight > window.innerWidth){
        alert("For best viewing experience, please use Landscape mode, and Refresh the page.");
    }
    // ====================================================================================

    // Define three scales
    xScale = d3.scale.linear().range([m.left, WIDTH - m.right - 50]).domain([-7, 2]).nice();
    yScale = d3.scale.ordinal()
        .domain([-1, 01, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24])
        .rangeRoundBands([m.top, HEIGHT - m.bottom]);

    yAgeTicks3 = ["", "1 (BL=3)", "", ""];

    yAgeTicks = ["1 (BL=3)", "2 (BL=3)", "3 (BL=6)", "4 (BL=3)",
        "5 (BL=1)", "6 (BL=3)", "7 (BL=2)", "8 (BL=3)", "9 (BL=6)",
        "10 (BL=3)", "11 (BL=3)", "12 (BL=2)", "13 (BL=4)", "14 (BL=4)",
        "15 (BL=3)", "16 (BL=4)", "17 (BL=3)", "18 (BL=3)", "19 (BL=5)",
        "20 (BL=5)", "21 (BL=4)", "22(BL=4)", "23 (BL=3)"];


    yAgeTicks2 = ["", "1 (BL=3)", " ", " ", " ",
        " ", " ", "", "", "",
        "", "", "", "", "",
        "", "", "", "", "",
        "", "", "", "", ""];

    yAgeTicksBlank = ["", "", " ", " ", " ",
        " ", " ", "", "", "",
        "", "", "", "", "",
        "", "", "", "", "",
        "", "", "", "", ""];

    yAgeTicks4 = ["", "1 (BL=3)", " ", " ", " ",
        " ", " ", "", "8 (BL=3)", "",
        "", "", "", "", "",
        "", "", "", "", "",
        "", "", "", "", ""];

    yAgeTicks5 = ["", "1 (BL=3)", " ", " ", " ",
        " ", " ", "", "8 (BL=3)", "",
        "", "", "", "", "",
        "", "", "", "", "19 (BL=5)",
        "", "", "", "", ""];

    yScale2 = d3.scale.ordinal()
        .domain(d3.range(0, yAgeTicks.length))
        .rangeRoundBands([(m.top), HEIGHT - m.bottom - 13]);

    // For vertical line at zero
    yScaleVerticalAtZero = d3.scale.ordinal()
        .domain(d3.range(0, 23))
        .rangeRoundBands([(m.top), HEIGHT - m.bottom - 13]);


    // ====================================================================================

    //Define X axis
    xAxis = d3.svg.axis()
            .scale(xScale)
            .orient("bottom")
            .ticks(9)
            .outerTickSize(0)
            .tickValues(d3.range(-6, 2))

    //Define Y axis
    yAxis = d3.svg.axis()
            .scale(yScale)
            .outerTickSize(0)
            .innerTickSize(-WIDTH)
            .ticks(23)
            .orient("left");

    yAxis2 = d3.svg.axis()
                .scale(yScale2)
                .innerTickSize(-WIDTH)
                .outerTickSize(0)
                .orient("left")
                .ticks(23)
                // .showYAxis(false)
                .tickFormat(function (d, i) {
                    return yAgeTicks[i];
                });

    yAxis3 = d3.svg.axis()
                .scale(yScale2)
                // .innerTickSize(-WIDTH)
                .outerTickSize(0)
                .orient("left")
                .ticks(23)
                // .showYAxis(false)
                .tickFormat(function (d, i) {
                    return yAgeTicks[i];
                });

    yAxis4 = d3.svg.axis()
                .scale(yScale2)
                // .innerTickSize(-WIDTH)
                .outerTickSize(0)
                .orient("left")
                .ticks(22)
                // .showYAxis(false)
                .tickFormat(function (d, i) {
                    return yAgeTicks[i];
                });

    // 
    // ====================================================================================


    var svg = d3.select("#dblContents").append("svg")
                .attr("width", WIDTH)
                .attr("height", HEIGHT)
                .append("g")
                .attr("transform", "translate(" + (m.left) + "," + (m.top) + ")scale(.75)");

    // ====================================================================================

    //// ====================================  Create X axis =====================================================================
    svg.append("g")
        .classed("x axis", true)
        .attr("transform", function() { if (bigScreen) { return "translate(0," + (HEIGHT - m.bottom - 20) + ")" }
                                        else { return "translate(0," + (HEIGHT - m.bottom -10) + ")" }
                                    })
        .classed("myxaxis", true)
        .attr("stroke", 0)
        .call(xAxis);

    //Create Y axis
    // svg.append("g")
    //     .attr("class", "y axis")
    //     .style("stroke-width", 0)
    //     .attr("transform", "translate(" + (m.left + 100) + "," + m.top + ")")
    //     .attr("font-size" , function () { if (window.innerHeight > 400) { return "12px" } else { return "12px"}})
    // .call(yAxis);

    // Create y-axix2
    // svg.append("g")
    //     .attr("class", "y axis y2")
    //     .attr("transform", "translate(" + (m.left) + ", 100)")
    //     .attr("font-size" , function () { if (window.innerHeight > 400) { return "12px" } else { return "22px"}})
    //     .call(yAxis2);

    // // d3.select(".domain").remove();

    // svg.append("g")
    //     .attr("class", "y axis y2")
    //     .attr("transform", "translate(" + (m.left) + ", 100)")
    //     .style("font-size", function () { if (window.innerHeight > 400) { return "12px" } else { return "8px"}} )
    //     // .call(yAxis4);


    // ====================== Draw a vertical line at 0 position =========================
    var yScaleVerticalAtZero = d3.svg.axis()
        .scale(yScaleVerticalAtZero)
        .orient("left")
        // .tickValues(tickData)
        .tickFormat("")
        // .innerTickSize(-HEIGHT);
        .outerTickSize(0);

    svg.append("g")
        .attr("class", "x2 axis")
        // .style("fill", "white")
        .attr("transform", "translate(" + xScale(0) + "," + 0 + ")")
        .call(yScaleVerticalAtZero);

        svg.append("g")
        .attr("class", "x2 axis")
        // .style("fill", "white")
        .attr("transform", "translate(" + xScale(-7) + "," + 0 + ")")
        .call(yScaleVerticalAtZero);
    
    // ====================== Dear a vertical line at 0 position =========================

    // Add title text
    title = svg.append("text")
        .attr("class", "title")
        // .attr("class", "x axis")
        .attr("text-anchor", "middle")  // this makes it easy to centre the text as the transform is applied to the anchor
        .attr("transform", "translate(" + (WIDTH / 2) + ", .5)")  // centre below axis
        .attr("dy", ".5em")
        .style("background-color", "white")
    // .text("Time to Unreversed 2-Point Decline in Motor Score (Unmatched)");

    xLabel = svg.append("svg:g")
        .append("text")
        // .attr("class", "x axis credit")
        .attr("text-anchor", "middle")  // this makes it easy to centre the text as the transform is applied to the anchor
        .attr("transform", "translate(" + (WIDTH / 2) + "," + (HEIGHT) + ")")  // centre below axis
        .attr("dy", ".35em")
        .style("font-size", function () { if (window.innerHeight > 400) { return "22px"} else { return "16px"}})
        .text("Change in ML Score");

    yLabel = svg.append("svg:g")
        .append("text")
        .attr("class", "credit")
        .attr("transform", "rotate(-90)")
        .attr("y", -50)
        .attr("x", -HEIGHT / 2.5)
        .attr("dy", ".35em")
        .style("font-size", function () { if (window.innerHeight > 400) { return "22px"} else { return "14px"}})
        .style("text-anchor", "middle")
        .text("BMN 190 Study Patient (BL Score)");

    // ========================================================================================================

    transition_duration = 1000


    

    // mid = function middle() {  // ====================================  mid =====================================================================
    //     slide3Pt1();
    //     setTimeout(function () {
    //         // updateYAxis(yAgeTicks4)
    //     }, 20000);
    //     setTimeout(function () {
    //         orangeSquare(1, 8)
    //     }, 20500);
    //     setTimeout(function () {
    //         // updateYAxis(yAgeTicks5)
    //     }, 40000);
    //     setTimeout(function () {
    //         orangeSquare(-1, 19)
    //     }, 40500);

    // };

    console.log(window.innerWidth)
    console.log(window.innerHeight)

    function navbar(num) {  // ====================================  navbar (num) ===================================================================== 
        // clearElements();
        svg.selectAll(".navi_bars").remove();
        svg.selectAll(".explainText1, .explainText2").remove();


        y_dots_data = [[11, -11], [11, -11], [11, -11]];

        navbarDelay = 4500

        console.log("width of the window" + WIDTH)

        var navi = svg.append("g") // create a group to incorporate all the navigation components
            .attr("class", "navi_bars")
            // .attr("transform" , "translate(" + (WIDTH * .8) + ")")

        nav = navi.selectAll(".navi_bars")
            .data(y_dots_data)

        navbarX = WIDTH - 50
        // navbarY = (function(d, i) { return 100 + (i * 45) })
        navbarWidth = WIDTH / 10
        navbarHeight = HEIGHT / 15
        nav.exit().remove();

        navbarCyAdjust = function (d, i) { return yScale(5) + (i * 45)}

        nav.enter() // ====================================  navbar 3 circles =====================================================================
            .append("circle")
            .attr("cx", navbarX)
            .attr("cy", function (d, i) { return yScale(5) + (i * 45)})
            .attr("r", function () { if (window.innerHeight > 400) { return 20 } else { return 12 }})
            .attr("opacity", 0)
            .transition().delay(function () { if (num === 3 | num === 4 | num === 5) { return 12000} else { return navbarDelay}}).duration(500) //added to delay slide 3 button apprearance 
            .attr("opacity", 1)
            .attr("fill", function (d, i) {
                if (i === 0) { return "#337AB7" } else if (i === 1) { return "#5CB85C" } else { return "orange" }
            })

        textButtonBack = navi.append("svg:g").append("text")  // ====================================  text button BACK =====================================================================
            .attr("class", 'navbarText')
            .attr("x", navbarX + 30)
            .attr("y", function (d, i) { return yScale(5) + (0 * 45)})
            .attr("dy", ".35em")
            .style("font-size", "16px")
            // .attr("fill", "red")
            .style("text-anchor", "start")
            .attr("opacity", 0)
            .text("Back")
            .transition().delay(function () { if (num === 3 | num === 4 | num === 5) { return 12000} else { return navbarDelay}}).duration(500) //added to delay slide 3 button apprearance 
            .attr("opacity", 1);

        textButtonReplay = navi.append("svg:g").append("text")  // ====================================  text button Replay =====================================================================
            .attr("x", navbarX + 30)
            .attr("y", function (d, i) { return yScale(5) + (1 * 45)})
            .attr("dy", ".35em")
            .style("font-size", "16px")
            // .attr("fill", "red")
            .style("text-anchor", "start")
            .text("Replay")
            .attr("opacity", 0)
            .transition().delay(function () { if (num === 3 | num === 4 | num === 5) { return 12000} else { return navbarDelay}}).duration(500) //added to delay slide 3 button apprearance 
            .attr("opacity", 1);


        textButtonNext = navi.append("svg:g").append("text") // ====================================  text button Next =====================================================================
            .attr("x", navbarX + 30)
            .attr("y", function (d, i) { return yScale(5) + (2 * 45)})
            .attr("dy", ".35em")
            .style("font-size", "16px")
            // .attr("fill", "red")
            .style("text-anchor", "start")
            .text("Next")
            .attr("opacity", 0)
            .transition().delay(function () { if (num === 3 | num === 4 | num === 5 ) { return 12000} else { return navbarDelay}}).duration(500) //added to delay slide 3 button apprearance 

            .attr("opacity", 1);

            explainGraph = svg.append("svg:g") // ====================================  Explore the Graph =====================================================================
                .append("text")
                .attr("x", WIDTH-40)
                .attr("y", function (d, i) { return yScale(2) + (i * 45)})
                .attr("dy", ".35em")
                .attr("class", "explainText1")
                .style("font-size", function () { if (window.innerHeight > 400) { return "18px" } else { return "15px" }})
                .style("text-anchor", "middle")
                .attr("opacity", 0)
                .text("Explore the Graph")
                // .on("click", navbar(1))
            .transition().delay(function () { if (num === 3 | num === 4 | num === 5) { return 12000} else { return navbarDelay}}).duration(500) //added to delay slide 3 button apprearance 
                .attr("opacity", 1)

            explainGraphNote = svg.append("svg:g")  // ====================================  Please click the circles below =====================================================================
                .append("text")
                .attr("x", WIDTH-40)                                                                                                                        
                .attr("y", function (d, i) { return yScale(3) + (i * 45)})
                .attr("dy", ".35em")                                                                    
                .attr("class", "explainText2")
                .style("font-size", "12px")
                .style("text-anchor", "middle")
                .attr("opacity", 0)
                .text(function () { if (bigScreen) { return "Please click the circles below for navigation"} else { return "" }})
            .transition().delay(function () { if (num === 3 | num === 4 | num === 5 | num === 6 | num === 7) { return 12000} else { return navbarDelay}}).duration(500) //added to delay slide 3 button apprearance 
                .attr("opacity", 1)

        nav.on("click", function (d, i) {
            if (num === 1) { // =========================================== 1 ===========================================
                if (i === 0) {
                    // explainAxis();
                    smallBubble();
                    clearTimeout(setLinesFc);
                    clearTimeout(setSecondSquare);


                } else if (i === 1) {
                    fc();
                    // navbar(1)
                } else if (i === 2) {
                    explainAxis();
                    clearTimeout(setLinesFc);
                    clearTimeout(setSecondSquare);

                    // navbar(2);
                }


            } else if (num === 2) { // =========================================== 2 ===========================================
                if (i === 0) {
                    fc();

                } else if (i === 1) {
                    // navbar(2)
                    explainAxis()
                } else if (i === 2) {

                    slide3Pt1();
                    clearTimeout(setLinesFc);
                    clearTimeout(setSecondSquare);

                    // navbar(3);
                }


            } else if (num === 3) { // =========================================== 3 ===========================================
                if (i === 0) {
                    d3.selectAll(".onesquare2").remove()
                    d3.selectAll(".onesquare3").remove()

                    explainAxis()
                    // navbar(2)
                } else if (i === 1) {

                    slide3Pt1();
                    // mid();
                    // navbar(1)
                } else if (i === 2) {
                    // navbar(2);
                    d3.selectAll(".onesquare2").remove()
                    d3.selectAll(".onesquare3").remove()

                    
                    slide3Pt8();
                }

            } else if (num === 4) { // =========================================== 4 ===========================================
                if (i === 0) {
                    d3.selectAll(".onesquare2").remove()
                    d3.selectAll(".onesquare3").remove()

                    slide3Pt1();
                    // navbar(2)
                } else if (i === 1) {

                    slide3Pt8();
                    // navbar(1)
                } else if (i === 2) {
                    // navbar(2);
                    d3.selectAll(".onesquare2").remove()
                    d3.selectAll(".onesquare3").remove()

                    slide3Pt19();

                    }

            } else if (num === 5) { // =========================================== 5 ===========================================
                if (i === 0) {
                    d3.selectAll(".onesquare2").remove()
                    d3.selectAll(".onesquare3").remove()

                    slide3Pt8();
                    // navbar(2)
                } else if (i === 1) {

                    slide3Pt19();
                    
                    // navbar(1)
                } else if (i === 2) {
                    // navbar(2);
                    d3.selectAll(".onesquare2").remove()
                    d3.selectAll(".onesquare3").remove()

                    bigBubble();
                }

            } else if (num === 6) { // =========================================== 6 ===========================================
                if (i === 0) {
                    
                    
                    slide3Pt19();

                } else if (i === 1) {
                    
                    bigBubble();
                    // navbar(1)
                
                } else if (i === 2) {
                    // navbar(2);
                    smallBubble();
                }


            } else if (num === 7) { // =========================================== 7 ===========================================
                if (i === 0) {
                    bigBubble()

                } else if (i === 1) {
                    smallBubble();
                    // navbar(1)
                } else if (i === 2) {
                    // navbar(2);
                    fc();
                }
            }
        })

    };  // end function navbar


    function clearElements() {
        d3.selectAll(".square").remove();
        d3.selectAll(".allBubbles").remove();
        // d3.selectAll(".hlines").remove();
        d3.selectAll(".square2").remove();
        d3.selectAll(".sevenThree").remove();
        d3.selectAll(".bigBubble").remove();
        d3.selectAll(".smallBubble").remove();
        d3.selectAll(".onesquare").remove();
        d3.selectAll(".circle12").remove();
        d3.selectAll(".rowBox").remove();
        d3.selectAll(".legend").remove();
        d3.selectAll(".circle1").remove();
        d3.selectAll(".threeBoxYLabel").remove();
        d3.selectAll(".textBox1").remove();
        d3.selectAll(".textBox1Square1").remove();
        d3.selectAll(".squareSymbolTooltip").remove();
        d3.selectAll(".bubbleText").remove();
        d3.selectAll(".yTexts").remove();
        d3.selectAll(".zeroBlockingBox").remove();
        d3.selectAll(".zero").remove();
        d3.selectAll(".zeroOne").remove();
        d3.selectAll(".zeroTwo").remove();
        d3.selectAll(".circle1").remove();
        d3.selectAll(".circle2").remove();
        d3.selectAll(".slide7num").remove();
        d3.selectAll(".slide6num").remove();
        clearTimeout(showBubbleTextVar);
        clearTimeout(setSquare2);
        clearTimeout(setTextBox8);
        clearTimeout(setSquare3);
        clearTimeout(setTextBox19);
    }



    function updateYAxis(tickFormatName) {

                d3.selectAll(".y2").remove();

                yAxis2.tickFormat(function (d, i) {
                    return tickFormatName[i];
                });
                // yAxisText();
                // Create y-axix2
                svg.append("g")
                    .attr("class", "y axis y2")
                    .attr("transform", "translate(" + (m.left) + ",0)")
                    // .call(yAxis2);
            } // end updateYAxis function

    function orangeSquare(x, y) {
        svg.selectAll(".onesquare")
            .data([x, y])
            .enter().append("path")
            // .transition().delay(4500).duration(1)
            .attr("class", "onesquare")
            .attr("fill", "orange")
            .attr("d", d3.svg.symbol().type("square"))
            .attr("transform", function (d) { return "translate(" + xScale(x) + "," + yScale(y) + ")"; })
            .style("z-index", 10);
    }

    circleLabel = function (numClass, delay1, xCor, yCor, text, delay2, opacity) {
            
            svg.append("svg:g")
                .append("text")
                .attr("class", numClass)
                .attr("text-anchor", "middle")  // this makes it easy to centre the text as the transform is applied to the anchor
                .attr("transform", "translate(" + xScale(xCor) + "," + yScale(yCor) + ")")  // centre below axis
                .attr("dy", ".35em")
                .transition().delay(delay1).duration(0)
                .text(text)
                .transition().delay(delay2).duration(0)
                .attr("opacity", opacity)
            }

    function rowBox(y2Box = (HEIGHT - m.bottom - m.top - m.bottom - m.bottom)) {

        var box1 = svg.selectAll(".rowBox")
            .data([0, 1]);
        box1.exit().remove();

        box1.enter().append("rect")
            .transition().delay(2000)
            .attr("class", "rowBox")
            .attr("x", (m.left - 70))
            .attr("y", (HEIGHT - m.top - m.bottom) / 16)
            .attr("width", WIDTH * 0.8)
            .attr("height", 25)
            .attr("fill", "none")
            .attr("stroke", "darkgray")
            .transition().delay(6000).duration(6000)
            .attr('y', y2Box)
            .transition().delay(12000).duration(1000)
            .attr('y', (HEIGHT - m.top - m.bottom) / 16)
    }

    boxSize = {
        width: (xScale(1) - xScale(0)),
        height: (yScale(2) - yScale(0))
        }

    function highlightBoxPt1() {

        // d3.selectAll(".rowBox").remove();
        // var hbox1 = svg.selectAll(".rowBox")
        //     .data([0, 1]);
        // hbox1.exit().remove();

        // hbox1.enter().append("rect")
        //     .attr("class", "rowBox")
        //     .attr("x", xScale(0) - (boxSize.width * .8)/ 2)
        //     .attr("y", yScale(1) - boxSize.height / 2)
        //     .attr("width", boxSize.width * .8)
        //     .attr("height", boxSize.height)
        //     .attr("fill", "none")
        //     .attr("stroke", "darkgray")
        //     .attr("stroke-width", 6)
        //     .transition().delay(textBoxMoveDelay + 5000).duration(1)
        //     .attr('x', xScale(-6.5) - boxSize.width)
        //     .attr("y", yScale(1) - boxSize.height / 2)

        //     .transition().delay(textBoxMoveDelay + 10000).duration(1)
        //     .attr('x', xScale(0) - boxSize.width * .8/ 2)
        //     .attr('y', yScale(25));

        

// ==========================================================================================================================
    } // end highlightBox1



    function highlightBoxPt8() {

        // d3.selectAll(".rowBox").remove();
        // var hbox1 = svg.selectAll(".rowBox")
        //     .data([0, 1]);
        // hbox1.exit().remove();

        // hbox1.enter().append("rect")
        //     .attr("class", "rowBox")
        //     .attr('x', xScale(1) - boxSize.width * .8/ 2)
        //     .attr("y", yScale(8) - boxSize.height / 2)
        //     .attr("width", boxSize.width * .8)
        //     .attr("height", boxSize.height)
        //     .attr("fill", "none")
        //     .attr("stroke", "darkgray")
        //     .attr("stroke-width", 6)

        //     .transition().delay(textBoxMoveDelay + 4000).duration(1)
        //     .attr('x', xScale(-6.5) - boxSize.width)
        //     .attr("y", yScale(8) - boxSize.height / 2)

        //     .transition().delay(textBoxMoveDelay + 10000).duration(1)
        //     .attr('x', xScale(1) - boxSize.width  * .8/ 2)
        //     .attr('y', yScale(25));

 
        


    } // end highlightBox for Pt 8



    function highlightBoxPt19() {

        // d3.selectAll(".rowBox").remove();
        // var hbox1 = svg.selectAll(".rowBox")
        //     .data([0, 1]);
        // hbox1.exit().remove();

        // hbox1.enter().append("rect")
        //     .attr("class", "rowBox")
        //     .attr('x', xScale(-1) - boxSize.width  * .8/ 2)
        //     .attr('y', yScale(19) - boxSize.height / 2)
        //     .attr("width", boxSize.width * .8)
        //     .attr("height", boxSize.height)
        //     .attr("fill", "none")
        //     .attr("stroke", "darkgray")
        //     .attr("stroke-width", 6)

        //     .transition().delay(textBoxMoveDelay + 4000).duration(1)
        //     .attr('x', xScale(-6.5) - boxSize.width)
        //     .attr("y", yScale(19) - boxSize.height / 2)

        //     .transition().delay(textBoxMoveDelay + 10000).duration(1)
        //     .attr('x', xScale(-1) - boxSize.width  * .8/ 2)
        //     .attr('y', yScale(25));

        

    } // end highlightBox for Pt 19


    // function highlightBox2() {
    //     boxWidth = xScale(1) - xScale(0)
    //     boxHeight = yScale(1) - yScale(0)
    //     d3.selectAll(".rowBox").remove();
    //     var hbox1 = svg.selectAll(".rowBox")
    //         .data([0, 1]);
    //     hbox1.exit().remove();

    //     hbox1.enter().append("rect")
    //         .attr("class", "rowBox")
    //         .attr("x", xScale(0) - boxWidth / 2)
    //         .attr("y", yScale(1) - boxHeight / 2)
    //         .attr("width", boxWidth)
    //         .attr("height", boxHeight)
    //         .attr("fill", "none")
    //         .attr("stroke", "darkgray")
    //         .attr("stroke-width", 2)
    //         .transition().delay(8000).duration(1)
    //         .attr('x', xScale(-7) - boxWidth)
    //         .attr("y", yScale(1) - boxHeight / 2)
    //         .transition().delay(16000).duration(1)
    //         .attr('x', xScale(0) - boxWidth / 2)
    //         .attr('y', yScale(25) + 10)

    // }

    // function highlightBox3() {
    //     boxWidth = xScale(1) - xScale(0)
    //     boxHeight = yScale(1) - yScale(0)
    //     d3.selectAll(".rowBox").remove();
    //     var hbox1 = svg.selectAll(".rowBox")
    //         .data([0, 1]);
    //     hbox1.exit().remove();

    //     hbox1.enter().append("rect")
    //         .attr("class", "rowBox")
    //         .attr("x", xScale(0) - boxWidth / 2)
    //         .attr("y", yScale(1) - boxHeight / 2)
    //         .attr("width", boxWidth)
    //         .attr("height", boxHeight)
    //         .attr("fill", "none")
    //         .attr("stroke", "darkgray")
    //         .attr("stroke-width", 2)
    //         .transition().delay(8000).duration(1)
    //         .attr('x', xScale(-7) - boxWidth)
    //         .attr("y", yScale(1) - boxHeight / 2)
    //         .transition().delay(16000).duration(1)
    //         .attr('x', xScale(0) - boxWidth / 2)
    //         .attr('y', yScale(25) + 10)

    // }

    //------------------------ Begin Frame 2  ------------------------------------------------


    // Slide 2
    function explainAxis() {

        clearElements();
        d3.selectAll(".hlines").remove();
        updateYAxis(yAgeTicks3)

        orangeSquare(0, 1);

        // rowBox((HEIGHT-m.top-m.bottom)/16);

        bubble1 = svg.selectAll("circle1")
            .data([0, 1]);

        bubble1.exit().remove();

        bubble1.enter()
            .append("circle")
            .attr("class", "bigBubble")
            .attr("cx", function (d) {
                return xScale(-2);
            })
            .attr("cy", function (d) {
                return yScale(1);
            })
            .attr("r", 0)
            .attr("opacity", 0)
            .attr("fill", '#7CCDD4')
            .transition().delay(4000).duration(2000).ease("elastic")
            .attr("opacity", 1)
            // .transition().delay(textBoxMoveDelay+2500).duration(textBoxMoveDuration)
            .attr("r", function (d) {
                return (6 + (5 * .7))
            });

        defaultLeftSlide2 = -5
        defaultTopSlide2 = 2.8



        leftAdjustForSmallScreen = function () { if (bigScreen) { return WIDTH/2.75 + "px"} else { return "137px"}}
        topAdjustForSmallScreen = function () { if (bigScreen) { return window.innerHeight / defaultTopSlide2 + "px"} else { return "145px"}}


    // ============================================================
        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-4))
            .attr("y", yScale(1))
            .attr("dy", ".35em")
            // .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "start")
            .transition().duration(2000)
            .text("Each row of the Y axis represents a BMN 190 Study Patient")
            .attr("opacity", 1)
            .attr('x', xScale(-6.9))
            .attr("y", yScale(1))
            .transition().delay(4000).duration(1000)
            .attr("y", function () { if (bigScreen) { return yScale(1)} else { return yScale(5)}})

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-4))
            .attr("y", yScale(2))
            .attr("dy", ".35em")
            .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "start")
            .transition().duration(2000)
            .text("along with starting baseline (BL) motor-langurage (ML) score. ")
            .attr("opacity", 1)
            .attr('x', xScale(-6.9))
            .attr("y", yScale(2))
            .transition().delay(4000).duration(1000)
            .attr("y", function () { if (bigScreen) { return yScale(2)} else { return yScale(6)}})

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-2))
            .attr("y", yScale(5))
            .attr("dy", ".35em")
            // .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .attr("opacity", 0)
            .transition().delay(4000).duration(1000)
            .attr("opacity", 1)
            .text("Each Study Patient is matched to")
            .attr('x', xScale(-2))
            .attr("y", yScale(2))
            // .transition().delay(4000).duration(1000)
            // .attr("y", function () { if (bigScreen) { return yScale(1)} else { return yScale(4)}})

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-2))
            .attr("y", yScale(6))
            .attr("dy", ".35em")
            .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .attr("opacity", 0)
            .style("text-anchor", "middle")
            .transition().delay(4000).duration(1000)
            .text("one or more Natural History Patients.")
            .attr("opacity", 1)
            .attr('x', xScale(-2))
            .attr("y", yScale(3))
            // .transition().delay(4000).duration(1000)
            // .attr("y", function () { if (bigScreen) { return yScale(2)} else { return yScale(5)}})

        pt1Label();

        legendOrangeSquareText();
        legendBlueBubbleText();
        legendOrangeSquare();
        legendBlueBubble();

    // ============================================================
        navbar(2)
    } // end explainAxis function


    //------------------------ Begin Frame 3  ------------------------------------------------

    // --------------------y axis labels ----------------------------

        var pt1Label = function () {
                        svg.append("svg:g")
                            .append("text")
                            .attr("class", "threeBoxYLabel")
                            .attr('x', xScale(-7.05))
                            .attr("y", yScale(1))
                            .attr("dy", ".35em")
                            .style("font-size", "18px")
                            .style("text-anchor", "end")
                            .attr("opacity", 0)
                            .text("1 (BL=3)")
                            .attr("opacity", 1)
                        } //end pt1Label

    // =======================================================  Slide 3  ========================================================================
    function slide3Pt1() {
        clearElements();
        d3.selectAll(".hlines").remove();
    
        updateYAxis(yAgeTicksBlank)
        pt1Label();

        orangeSquare(0, 1);

        function zeroBlockingBox () {
            svg. append("rect")
            .attr("opacity", 0)
            .classed("zeroBlockingBox", true)
            .attr("width", (xScale(3) - xScale(1)))
            .attr("height", yScale(3))
            .attr("x", xScale(-1.2))
            // .attr("y", HEIGHT *.78)// yScale(22.5))
            .attr("y", yScale(21))// yScale(22.5))
            .attr("fill", "white")
            .transition().delay(8000).duration(1000)
            .attr("opacity", 1);
        };

        // zeroBlockingBox();
        // d3.selectAll("")

        // highlightBoxPt1();
        (function slide3Pt1TextBoxes () {
        svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(-4))
                    .attr("y", yScale(1))
                    .attr("dy", ".35em")
                    // .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "start")
                    .transition().duration(2000)
                    .text("BMN-190 Study Patient (1) has")
                    .attr("opacity", 1)
                    .attr('x', xScale(-6.9))
                    .attr("y", yScale(1))
                    .transition().delay(4000).duration(1000)
                    .attr("y", function () { if (bigScreen) { return yScale(1)} else { return yScale(4)}})

                            
        svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(-4))
                    .attr("y", yScale(2))
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "start")
                    .transition().duration(2000)
                    .text("a starting baseline (BL) score of 3.")
                    .attr("opacity", 1)
                    .attr('x', xScale(-6.9))
                    .attr("y", yScale(2))
                    .transition().delay(4000).duration(1000)
                    .attr("y", function () { if (bigScreen) { return yScale(2)} else { return yScale(5)}})

// ==========================================================================================================================
            svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(-3))
                    .attr("y", yScale(1))
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "end")
                    .transition().delay(4000).duration(2000)
                    .text("Orange squares corresponds to the patient's")
                    .attr("opacity", 1)
                    .attr('x', xScale(-.10))
                    .attr("y", yScale(1))
        
                    
        svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(-3))
                    .attr("y", yScale(2))
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "end")
                    .transition().delay(4000).duration(2000)
                    .text("ML score change from BL over the duration of treatment.")
                    .attr("opacity", 1)
                    .attr('x', xScale(-.10))
                    .attr("y", yScale(2))
// ==========================================================================================================================

        textZero = svg.append("text")
                    .attr("class", "zero")
                    .attr("opacity", 0)
                    .attr('x', xScale(-0))
                    .attr("y", function () { if (bigScreen) { return yScale(19) } else { return yScale(17)}})
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "middle")
                    .attr("fill", "#fff")
                    .text("A value of 0 on the X axis indicates")
                    .attr("opacity", 1)
                    .style("z-index", 10)
                    // .transition().duration(1000)
                    // .attr('x', xScale(0))
                    .attr("y", function () { if (bigScreen) { return yScale(23) } else { return yScale(21)}})
                    // .attr('x', xScale(0))
                    // .attr("y", function () { if (bigScreen) { return yScale(23) } else { return yScale(21)}})

        
        var bboxZero = textZero.node().getBBox();

        var rect = svg.append("rect")
            .classed("zeroOne", true)
            .transition().delay(9000).duration(0)
            .attr("x", bboxZero.x)
            .attr("y", bboxZero.y)
            .attr("width", bboxZero.width)
            .attr("height", bboxZero.height)
            .style("fill", "#fff")
          
          svg.append("text")
            .attr("class", "zero")
            .attr("opacity", 0)
            .attr('x', xScale(0))
            .attr("y", function () { if (bigScreen) { return yScale(19) } else { return yScale(17)}})
            .attr("dy", ".35em")
            .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .transition().delay(8000).duration(2000)
            .text("A value of 0 on the X axis indicates")
            .attr("opacity", 1)
            .attr('x', xScale(0))
            .attr("y", function () { if (bigScreen) { return yScale(23) } else { return yScale(21)}});
                    
        // -----------------------------------------------------       
        textZeroTwo = svg.append("text")
                        .attr("class", "zeroTwo")
                        .attr("opacity", 0)
                        .attr('x', xScale(0))
                        .attr("y", function () { if (bigScreen) { return yScale(20) } else { return yScale(18)}})
                        .attr("dy", ".35em")
                        .style("font-size", "14px")
                        .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                        .style("text-anchor", "middle")
                        .style("fill", "#fff")
                        .text("no decline in ML score for this patient.")
                        .attr("opacity", 1)
                        .attr('x', xScale(0))
                        .attr("y", function () { if (bigScreen) { return yScale(24) } else { return yScale(22)}})

        var bboxZeroTwo = textZeroTwo.node().getBBox();

        var rect = svg.append("rect")
            .classed("zeroTwo", true)
            .transition().delay(9000).duration(0)
            .attr("x", bboxZeroTwo.x)
            .attr("y", bboxZeroTwo.y)
            .attr("width", bboxZeroTwo.width)
            .attr("height", bboxZeroTwo.height)
            .style("fill", "#fff")

        // line to overlap the the white dash   
        lineGen = svg.append("line")
                    .attr("x1", xScale(0))
                    .attr("y1", yScale2(10))
                    .attr("x2", xScale(0))
                    .attr("y2", yScale(24))
                    .attr("transform", "translate(0, 20)")
                    .attr("stroke-width", 1)
                    .attr("stroke", "black")
                    .attr("opacity", 1)
                    .transition().delay(9000)
                    .attr("opacity", 0)

        svg.append("text")
            .attr("class", "zeroTwo")
            .attr("opacity", 0)
            .attr('x', xScale(0))
            .attr("y", function () { if (bigScreen) { return yScale(20) } else { return yScale(18)}})
            .attr("dy", ".35em")
            .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .transition().delay(8000).duration(2000)
            .text("no decline in ML score for this patient.")
            .attr("opacity", 1)
            .attr('x', xScale(0))
            .attr("y", function () { if (bigScreen) { return yScale(24) } else { return yScale(22)}})


        }());



        
        // defaultLeftSlide2 = -5
        // defaultTopSlide2 = 2.8




        // var textbox31 = d3.select('#dblContents')
        //     .append('div')
        //     .attr("class", "textBox1");

        // textbox31.html("Orange squares <span style='color:orange'>&#9632;</span> corresponds to a BMN-190 Study Patient's ML score change from BL over the duration of treatment. </br></br>This BMN-190 Study Patient(1) has starting baseline (BL) score of 3. </br>A value of 0 on the X axis indicates no decline in ML score for this patient.")
        //     // .style("left", "15%")
        //     .style("left", WIDTH/2.75 + "px")
        //     .style("top", window.innerHeight / defaultTopSlide2 + "px")
        //     .style("text-align", "center")
        //     .style("padding-top", "10px")
        //     .style("background-color", "#EFF8FB")
        //     .style("z-index", 5)
        //     .transition().delay(textBoxMoveDelay + 1500).duration(textBoxMoveDuration)
        //     .style("top", window.innerHeight / defaultTopSlide2 + "px")
        //     .transition().delay(19000).duration(textBoxMoveDuration)
        //     .style("opacity", 0);

        navbar(3);
    };


    // ==========================================  Draw 2nd square; orange square for Pt 8   ========================================================== 

    slide3Pt8 = function () {

        clearElements();
        d3.selectAll(".hlines").remove();
        updateYAxis(yAgeTicksBlank)

         var pt8Label = function () {
                    svg.append("svg:g")
                        .append("text")
                        .attr("class", "threeBoxYLabel")
                        .attr('x', xScale(-7.05))
                        .attr("y", yScale(8))
                        .attr("dy", ".35em")
                        .style("font-size", "18px")
                        .style("text-anchor", "end")
                        .attr("opacity", 0)
                        .text("8 (BL=3)")
                        .attr("opacity", 1)
                    } // end pt2Label



        pt8Label();        
        orangeSquare(1, 8);

// ==========================================================================================================================
        (function () { svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(1))
                    .attr("y", yScale(11))
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", function () { if (bigScreen) { return "middle"} else { return "end"} })
                    .transition().delay(4000).duration(2000)
                    .text("Patient gained one point")
                    .attr("opacity", 1)
                    .attr('x', xScale(1))
                    .attr("y", yScale(9))
                    // .transition().delay(5000)
        
                svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(1))
                    .attr("y", yScale(12))
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    // .style("text-anchor", "middle")
                    .style("text-anchor", function () { if (bigScreen) { return "middle"} else { return "end"} })
                    .transition().delay(4000).duration(2000)
                    .text("in ML score.")
                    .attr("opacity", 1)
                    .attr('x', xScale(1))
                    .attr("y", yScale(10))
                    // .transition().delay(5000)
// ==========================================================================================================================
                svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(-4))
                    .attr("y", yScale(8))
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "start")
                    .transition().duration(2000)
                    .text("Study Patient (8) had a starting")
                    .attr("opacity", 1)
                    .attr('x', xScale(-6.9))
                    .attr("y", yScale(8))
                    // .transition().delay(5000)

                            
        svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(-4))
                    .attr("y", yScale(9))
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "start")
                    .transition().duration(2000)
                    .text("baseline (BL) score of 3.")
                    .attr("opacity", 1)
                    .attr('x', xScale(-6.9))
                    .attr("y", yScale(9))

// ==========================================================================================================================

 

        svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(1))
                    .attr("y", yScale(19))
                    .attr("y", function () { if (bigScreen) { return yScale(19) } else { return yScale(17)}})
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "middle")
                    .transition().delay(8000).duration(2000)
                    .text("Therefore, patient's last ML score")
                    .attr("opacity", 1)
                    .attr('x', xScale(1))
                    .attr("y", yScale(23))
                    .attr("y", function () { if (bigScreen) { return yScale(23) } else { return yScale(21)}})
                    // .transition().delay(5000)

                            
        svg.append("text")
                    .attr("class", "threeBoxYLabel")
                    .attr("opacity", 0)
                    .attr('x', xScale(1))
                    .attr("y", yScale(20))
                    .attr("y", function () { if (bigScreen) { return yScale(20) } else { return yScale(18)}})
                    .attr("dy", ".35em")
                    .style("font-size", "14px")
                    .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                    .style("text-anchor", "middle")
                    .transition().delay(8000).duration(2000)
                    .text("is 4 (3 + 1).")
                    .attr("opacity", 1)
                    .attr('x', xScale(1))
                    .attr("y", yScale(24))
                    .attr("y", function () { if (bigScreen) { return yScale(24) } else { return yScale(22)}})

        }());


        // setSquare2 = setTimeout(function () { 
        //     svg.selectAll(".onesquare2")
        //         .data([0, 1])
        //         .enter().append("path")
        //         // .transition().delay(4500).duration(1)
        //         .attr("class", "onesquare2")
        //         .attr("fill", "orange")
        //         .attr("d", d3.svg.symbol().type("square"))
        //         .attr("transform", function (d) { return "translate(" + xScale(1) + "," + yScale(8) + ")"; })
        //         .style("z-index", 10);
        // }, 20500); // end setTimeout



        // setTextBox8 = setTimeout(function () {
        //     defaultLeftSlide2 = -5
        //     defaultTopSlide2 = 2.8

        //     var textbox32 = d3.select('#dblContents')
        //         .append('div')
        //         .attr("class", "textBox1");

        //     textbox32.html("Another patient, Patient(8) gained one point in ML score. This patient has a starting baseline (BL) score of 3. </br>Therefore, patient's last ML score </br>is 4 (3 + 1).")
        //         .style("left", WIDTH/2.75 + "px")
        //         .style("top", window.innerHeight / defaultTopSlide2 + "px")
        //         .style("text-align", "center")
        //         .style("padding-top", "10px")
        //         .style("background-color", "#EFF8FB")
        //         .style("z-index", 5)
        //         // .transition().delay(textBoxMoveDelay+1500).duration(textBoxMoveDuration)
        //         // .style("top", window.innerHeight/defaultTopSlide2 + "px")
        //         .transition().delay(18000).duration(textBoxMoveDuration)
        //         .style("opacity", 0);

        // // }, 20500); // end setTimeout
        // }, 500); // end setTimeout


        navbar(4)
    }


    // =========================================================  Draw 3nd square; orange square for Pt 19   =====================================================================
    slide3Pt19= function () { 
                
                clearElements();
                d3.selectAll(".hlines").remove();
                updateYAxis(yAgeTicksBlank);

                var pt19Label = function () {
                                svg.append("svg:g")
                                    .append("text")
                                    .attr("class", "threeBoxYLabel")
                                    .attr('x', xScale(-7.05))
                                    .attr("y", yScale(19))
                                    .attr("dy", ".35em")
                                    .style("font-size", "18px")
                                    .style("text-anchor", "end")
                                    .attr("opacity", 0)
                                    .text("19 (BL=5)")
                                    .attr("opacity", 1)
                            }  // end pt3Label
                
                pt19Label();
                orangeSquare(-1, 19);

                (function () { 
                    svg.append("text")
                                .attr("class", "threeBoxYLabel")
                                .attr("opacity", 0)
                                .attr('x', xScale(-4))
                                .attr("y", yScale(19))
                                .attr("dy", ".35em")
                                .style("font-size", "14px")
                                .style("text-anchor", "start")
                                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                                .transition().duration(2000)
                                .text("Finally,Patient (19) had a starting")
                                .attr("opacity", 1)
                                .attr('x', xScale(-6.9))
                                .attr("y", yScale(19))
                                // .transition().delay(5000)

                                        
                    svg.append("text")
                                .attr("class", "threeBoxYLabel")
                                .attr("opacity", 0)
                                .attr('x', xScale(-4))
                                .attr("y", yScale(20))
                                .attr("dy", ".35em")
                                .style("font-size", "14px")
                                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                                .style("text-anchor", "start")
                                .transition().duration(2000)
                                .text("baseline (BL) score of 5.")
                                .attr("opacity", 1)
                                .attr('x', xScale(-6.9))
                                .attr("y", yScale(20))

            // // ==========================================================================================================================
                    svg.append("text")
                                .attr("class", "threeBoxYLabel")
                                .attr("opacity", 0)
                                .attr('x', xScale(-1.1))
                                .attr("y", yScale(15))
                                .attr("dy", ".35em")
                                .style("font-size", "14px")
                                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                                .style("text-anchor", "end")
                                .transition().delay(4000).duration(2000)
                                .text("This patient lost")
                                .attr("opacity", 1)
                                .attr('x', xScale(-1.1))
                                .transition().delay(6000)
                                .attr("y", function () { if (!bigScreen) { return yScale(17)} else { return yScale(19)}})
                                // .attr("y", yScale(19))
                                    
                    svg.append("text")
                                .attr("class", "threeBoxYLabel")
                                .attr("opacity", 0)
                                .attr('x', xScale(-1.1))
                                .attr("y", yScale(16))
                                .attr("dy", ".35em")
                                .style("font-size", "14px")
                                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                                .style("text-anchor", "end")
                                .transition().delay(4000).duration(2000)
                                .text("one point in ML score.")
                                .attr("opacity", 1)
                                .attr('x', xScale(-1.1))
                                // .attr("y", yScale(20))
                                .transition().delay(6000)
                                .attr("y", function () { if (!bigScreen) { return yScale(18)} else { return yScale(20)}})

            // // ==========================================================================================================================


                    svg.append("text")
                                .attr("class", "threeBoxYLabel")
                                .attr("opacity", 0)
                                .attr('x', xScale(-1))
                                .attr("y", yScale(17))
                                .attr("y", function () { if (bigScreen) { return yScale(19) } else { return yScale(17)}})
                                .attr("dy", ".35em")
                                .style("font-size", "14px")
                                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                                .style("text-anchor", "middle")
                                .transition().delay(8000).duration(2000)
                                .text("Therefore, patient's last")
                                .attr("opacity", 1)
                                .attr('x', xScale(-1))
                                .attr("y", yScale(21))
                                .attr("y", function () { if (bigScreen) { return yScale(23) } else { return yScale(21)}})
                                // .transition().delay(5000)

                                        
                    svg.append("text")
                                .attr("class", "threeBoxYLabel")
                                .attr("opacity", 0)
                                .attr('x', xScale(-1))
                                .attr("y", yScale(18))
                                .attr("y", function () { if (bigScreen) { return yScale(20) } else { return yScale(18)}})
                                .attr("dy", ".35em")
                                .style("font-size", "14px")
                                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                                .style("text-anchor", "middle")
                                .transition().delay(8000).duration(2000)
                                .text("ML score is 4 (5 - 1).")
                                .attr("opacity", 1)
                                .attr('x', xScale(-1))
                                .attr("y", yScale(22))
                                .attr("y", function () { if (bigScreen) { return yScale(24) } else { return yScale(22)}})
                    }());

                    

                // setSquare3 = setTimeout(function () { 
                //     svg.selectAll(".onesquare3")
                //         .data([0, 1])
                //         .enter().append("path")
                //         // .transition().delay(4500).duration(1)
                //         .attr("class", "onesquare3")
                    // .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                //         .attr("fill", "orange")
                //         .attr("d", d3.svg.symbol().type("square"))
                //         .attr("transform", function (d) { return "translate(" + xScale(-1) + "," + yScale(19) + ")"; })
                //         .style("z-index", 10);
                // }, 40500);


                // setTextBox19 = setTimeout(function () {
                //     defaultLeftSlide2 = -5
                //     defaultTopSlide2 = 3.5

                //     var textbox33 = d3.select('#dblContents')
                //         .append('div')
                //         .attr("class", "textBox1");

                //     textbox33.html("Finally, Patient(19) lost one point in ML score. </br>This patient has a starting baseline (BL) score of 5. Therefore, patient's last ML score is 4 (5 - 1).")
                //         // .style("left", "15%")
                //         .style("left", WIDTH/2.75 + "px")
                //         .style("top", window.innerHeight / defaultTopSlide2 + "px")
                //         .style("text-align", "center")
                //         .style("padding-top", "10px")
                //         .style("background-color", "#EFF8FB")
                //         .style("z-index", 5)
                //         .transition().delay(textBoxMoveDelay + 1500).duration(textBoxMoveDuration)
                //         .style("top", window.innerHeight / defaultTopSlide2 + "px");

                // // }, 40500); // end setTimeout
                // }, 500); // end setTimeout

                navbar(5);

            } // end slide3Pt19func



    //------------------------ Begin Frame 6  ------------------------------------------------

    // Slide 6
    function bigBubble() {

        clearElements();
        d3.selectAll(".hlines").remove();
        d3.selectAll(".smallBubble").remove();
        d3.selectAll(".textBox1").remove();
        d3.selectAll(".textBox1, .orange1").remove();
        d3.selectAll(".bigBubble").remove();
        d3.selectAll(".circle12").remove();

        updateYAxis(yAgeTicks3);

        orangeSquare(0, 1)

        defaultLeftSlide4 = -4
        defaultTopSlide4 = 2.9

        bubble1 = svg.selectAll(".circle1")
            .data([0, 1]);

        bubble1.exit().remove();

        bubble1.enter()
            .append("circle")
            .attr("class", "circle1")
            .attr("cx", function (d) {
                return xScale(0);
            })
            .attr("cy", function (d) {
                return yScale(1);
            })
            .attr("r", 6)
            .attr("fill", '#7CCDD4')
            .attr("opacity", 0)
            .attr("opacity", 1)
            .transition().delay(1000).duration(textBoxMoveDuration)
            .attr("cx", function (d) {
                return xScale(-3);
            })
            // .transition().delay(textBoxMoveDelay+2500).duration(textBoxMoveDuration)
            .attr("r", function (d) {
                return (6 + (10 * .7))
            })
            .transition().delay(11000).duration(textBoxMoveDuration)
            .attr("cx", function (d) {
                return xScale(-3.5);
            })
            .attr("r", function (d) {
                return (6 + (10 * .7))
            });



         bubble2 = svg.selectAll(".circle2")
                    .data([0, 1]);

        bubble2.exit().remove();

        bubble2.enter()
                .append("circle")
                .attr("class", "circle2")
                .attr("cx", function (d) {
                    return xScale(0);
                })
                .attr("cy", function (d) {
                    return yScale(1);
                })
                .attr("opacity", 0)
                .attr("r", 6)
                .attr("opacity", 1)
                .attr("fill", '#7CCDD4')
                .transition().delay(1000).duration(textBoxMoveDuration)
                .attr("cx", function (d) {
                    return xScale(-3);
                })
                .attr("r", function (d) {
                    return (6 + (10 * .7))
                })
                .transition().delay(11000).duration(textBoxMoveDuration)
                // .transition().delay(textBoxMoveDelay+2500).duration(textBoxMoveDuration)
                // .transition().delay(8000).duration(textBoxMoveDuration)
                .attr("cx", function (d) {
                return xScale(-2.5);
                })
                .attr("r", function (d) {
                    return (6 + (10 * .1))
                });

        // Circle Label for 7
        circleLabel("slide7num", 14000, -3.5, 1, "7", 15000, 1)
        
        // Circle Label for 3
        circleLabel("slide7num", 14000, -2.5, 1, "1", 15000, 1)

        defaultLeftSlide2 = -5
        defaultTopSlide2 = 2.8

        // var textbox41 = d3.select('#dblContents')
        //     .append('div')
        //     .attr("class", "textBox1");

        // textbox41.html("Blue bubbles <span style='color:#7CCDD4'><span style='font-size:20px'>&#11044;</span></span> corresponds to Natural History Patients matched to BMN-190 Study Patients <span style='color:orange'>&#9632;</span>.</br>Size of blue bubbles correspond to the number of matched Natural History Patients.")
        //     // .style("left", "15%")
        //     .style("left", leftAdjustForSmallScreen)
        //     .style("top", topAdjustForSmallScreen)
        //     .style("text-align", "center")
        //     .style("padding-top", "10px")
        //     .style("background-color", "#EFF8FB")
        //     .style("z-index", 5)



        // ============================================================
        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-6))
            .attr("y", yScale(2))
            .attr("dy", ".35em")
            // .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .transition().delay(1000).duration(2000)
            .text("Blue bubbles corresponds to Natural History Patients")
            .attr("opacity", 1)
            .attr('x', xScale(-3))
            .attr("y", yScale(2))
            // .transition().delay(4000).duration(1000)
            // .attr("y", function () { if (bigScreen) { return yScale(1)} else { return yScale(4)}})
            .transition().delay(8000).duration(1000)
            .attr("y", function () { if (bigScreen) { return yScale(5)} else { return yScale(8)}})

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-6))
            .attr("y", yScale(3))
            .attr("dy", ".35em")
            .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .transition().delay(1000).duration(2000)
            .text("matched to one or more BMN-190 Study Patients. ")
            .attr("opacity", 1)
            .attr('x', xScale(-3))
            .attr("y", yScale(3))
            .transition().delay(8000).duration(1000)
            .attr("y", function () { if (bigScreen) { return yScale(6)} else { return yScale(9)}})

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-6))
            .attr("y", yScale(2))
            .attr("dy", ".35em")
            // .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .attr("opacity", 0)
            .transition().delay(8000).duration(2000)
            .attr("opacity", 1)
            .text("Size of blue bubbles correspond to the")
            .attr('x', xScale(-3))
            .attr("y", yScale(2))
            // .transition().delay(4000).duration(1000)
            // .attr("y", function () { if (bigScreen) { return yScale(1)} else { return yScale(4)}})

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr('x', xScale(-6))
            .attr("y", yScale(3))
            .attr("dy", ".35em")
            .style("font-size", "14px")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .attr("opacity", 0)
            .style("text-anchor", "middle")
            .transition().delay(8000).duration(2000)
            .text("number of matched Natural History Patients.")
            .attr("opacity", 1)
            .attr('x', xScale(-3))
            .attr("y", yScale(3))

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr("dy", ".35em")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .attr("transform", "translate(0, 25)")
            .transition().delay(12000).duration(2000)
            .text("n = 7")
            .attr("opacity", 1)
            .attr('x', xScale(-3.5))
            .attr("y", yScale(0.51))

        svg.append("text")
            .attr("class", "threeBoxYLabel")
            .attr("opacity", 0)
            .attr("dy", ".35em")
            .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
            .style("text-anchor", "middle")
            .attr("transform", "translate(0, 25)")
            .transition().delay(12000).duration(2000)
            .text("n = 1")
            .attr("opacity", 1)
            .attr('x', xScale(-2.5))
            .attr("y", yScale(0.51))


        navbar(6);
    };

    //------------------ Begin Frame 7 (last one ) ------------------------------------------------------

    function smallBubble() {

        clearElements();
        d3.selectAll(".hlines").remove();
        svg.selectAll(".slide7num").remove();
        updateYAxis(yAgeTicks3);

        defaultLeftSlide5 = -4
        defaultTopSlide5 = 2.8


        bubble1 = svg.selectAll(".circle1")
            .data([0, 1]);

        bubble1.exit().remove();

        bubble1.enter()
            .append("circle")
            .attr("class", "circle1")
            .attr("cx", function (d) {
                return xScale(0);
            })
            .attr("cy", function (d) {
                return yScale(1);
            })
            .attr("r", 6)
            .attr("fill", '#7CCDD4')
            .attr("opacity", 0)
            .attr("opacity", 1)
            .transition().delay(1000).duration(textBoxMoveDuration)
            .attr("cx", function (d) {
                return xScale(-2.5);
            })
            // .transition().delay(textBoxMoveDelay+2500).duration(textBoxMoveDuration)
            .attr("r", function (d) {
                return (6 + (10 * .7))
            })
            .transition().delay(12000).duration(textBoxMoveDuration)
            .attr("cx", function (d) {
                return xScale(-3);
            })
            .attr("r", function (d) {
                return (6 + (7 * .7))
            });



         bubble2 = svg.selectAll(".circle2")
                    .data([0, 1]);

        bubble2.exit().remove();

        bubble2.enter()
                .append("circle")
                .attr("class", "circle2")
                .attr("cx", function (d) {
                    return xScale(0);
                })
                .attr("cy", function (d) {
                    return yScale(1);
                })
                .attr("opacity", 0)
                .attr("r", 6)
                .attr("opacity", 1)
                .attr("fill", '#7CCDD4')
                .transition().delay(1000).duration(textBoxMoveDuration)
                .attr("cx", function (d) {
                    return xScale(-2.5);
                })
                .attr("r", function (d) {
                    return (6 + (10 * .7))
                })
                .transition().delay(12000).duration(textBoxMoveDuration)
                // .transition().delay(textBoxMoveDelay+2500).duration(textBoxMoveDuration)
                // .transition().delay(8000).duration(textBoxMoveDuration)
                .attr("cx", function (d) {
                return xScale(-2);
                })
                .attr("r", function (d) {
                    return (6 + (3 * .7))
                });



                // ============================================================

        var flyingTextShort = function (text, xCorStart, yCorStart, delay1, duration1, xCorFinal, yCorFinal) {
                svg.append("text")
                .attr("class", "threeBoxYLabel")
                .attr("opacity", 0)
                .attr('x', xScale(xCorStart))
                .attr("y", yScale(yCorStart))
                .attr("dy", ".35em")
                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                .style("text-anchor", "middle")
                .transition().delay(delay1).duration(duration1)
                .text(text)
                .attr("opacity", 1)
                .attr('x', xScale(xCorFinal))
                .attr("y", yScale(yCorFinal))
            } 
        
        var flyingTextLong = function (text, xCorStart, yCorStart, delay1, duration1, xCorFinal, yCorFinal, delay2, duration2, yCorBigScreen, yCorSmallScreen, xCorBigScreen, xCorSmallScreen) {
            svg.append("text")
                .attr("class", "threeBoxYLabel")
                .attr("opacity", 0)
                .attr('x', xScale(xCorStart))
                .attr("y", yScale(yCorStart))
                .attr("dy", ".35em")
                .style("font-size", function () { if (bigScreen) { return "14px" } else { return "12px"}})
                .style("text-anchor", "middle")
                .transition().delay(delay1).duration(duration1)
                .text(text)
                .attr("opacity", 1)
                .attr('x', xScale(xCorFinal))
                .attr("y", yScale(yCorFinal))
                .transition().delay(delay2).duration(duration2)
                .attr("y", function () { if (bigScreen) { return yScale(yCorBigScreen)} else { return yScale(yCorSmallScreen)}})
                .attr("x", function () { if (bigScreen) { return xScale(xCorBigScreen)} else { return xScale(xCorSmallScreen)}})
            } // flyingText
        
        flyingTextLong("Study Patient (1), who did not lose any points,",-6, 2, 1000, 2000, -2.5, 2, 8000, 1000, 5, 8, -2.5, -2.5)
        flyingTextLong("had 10 matched Natural History Patients.",-6, 3, 1000, 2000, -2.5, 3, 8000, 1000, 6, 9, -2.5, -2.5)

        flyingTextShort("Out of 10, 7 patients lost all 3 points while", -6, 2, 8000, 2000, -2.5, 2)
        flyingTextShort("remaining 3 had a decline of 2 points.", -6, 3, 8000, 2000, -2.5, 3)
 
        orangeSquare(0, 1);


        defaultLeftSlide2 = -5
        defaultTopSlide2 = 2.8



        // Circle Label for 10
        circleLabel("slide10num", 3000, -2.5, 1, "10", 12000, 0)
        
        // Circle Label for 7
        circleLabel("slide7num", 14000, -3, 1, "7", 15000, 1)
        
        // Circle Label for 3
        circleLabel("slide7num", 14000, -2, 1, "3", 15000, 1)

        pt1Label();
        



        navbar(7)
    }; // end small bubble


    // =========== Complete chart ==============================================================================================
    // function dataImports() {
    //     d3.csv("bubble.csv", function (d) {
    //     return {
    //         sub: +d.sub,
    //         score: +d.score,
    //         count: +d.count
    //     };
    // }, function (bubbleData) {

    //     d3.csv("square.csv", function (error, data) {
    //         if (error) throw error;

            // Coerce the strings to numbers.
            // data.forEach(function (d) {
            //     d.sub = +d.sub,
            //         d.score = +d.score
            // })
            // =========================================================================================================
            var bubbleData = [{"sub":1,"id":1,"score":-3,"count":7},
                            {"sub":1,"id":1,"score":-2,"count":3},
                            {"sub":3,"id":3,"score":-6,"count":4},
                            {"sub":3,"id":3,"score":-5,"count":1},
                            {"sub":3,"id":3,"score":-4,"count":2},
                            {"sub":5,"id":5,"score":-1,"count":6, "overlap": 1},
                            {"sub":6,"id":6,"score":-3,"count":3},
                            {"sub":6,"id":6,"score":-2,"count":2},
                            {"sub":8,"id":7,"score":-2,"count":3},
                            {"sub":9,"id":8,"score":-3,"count":6},
                            {"sub":9,"id":8,"score":-1,"count":1},
                            {"sub":12,"id":11,"score":-3,"count":5},
                            {"sub":13,"id":12,"score":-2,"count":6},
                            {"sub":14,"id":13,"score":-4,"count":5},
                            {"sub":14,"id":13,"score":-3,"count":2},
                            {"sub":15,"id":14,"score":-4,"count":7},
                            {"sub":15,"id":14,"score":-3,"count":3},
                            {"sub":15,"id":14,"score":-1,"count":1, "overlap": 1},
                            {"sub":16,"id":15,"score":-3,"count":4},
                            {"sub":16,"id":15,"score":-1,"count":1},
                            {"sub":17,"id":16,"score":-4,"count":7},
                            {"sub":17,"id":16,"score":-3,"count":1},
                            {"sub":17,"id":16,"score":-2,"count":1, "overlap": 1},
                            {"sub":19,"id":18,"score":-3,"count":3},
                            {"sub":19,"id":18,"score":-2,"count":2},
                            {"sub":20,"id":19,"score":-5,"count":4},
                            {"sub":20,"id":19,"score":-4,"count":3},
                            {"sub":20,"id":19,"score":-3,"count":5},
                            {"sub":20,"id":19,"score":0,"count":1},
                            {"sub":21,"id":20,"score":-5,"count":1},
                            {"sub":23,"id":22,"score":-4,"count":1},
                            {"sub":23,"id":22,"score":-2,"count":1},
                            {"sub":24,"id":23,"score":-3,"count":4},
                            {"sub":24,"id":23,"score":-1,"count":1}]

    var data = [{"sub":1,"id":1,"score":0,"ylabel":"1 (BL=3)"},
                {"sub":2,"id":2,"score":0,"ylabel":"2 (BL=3)"},
                {"sub":3,"id":3,"score":0,"ylabel":"3 (BL=6)"},
                {"sub":4,"id":4,"score":-1,"ylabel":"4 (BL=3)"},
                {"sub":5,"id":5,"score":-1,"ylabel":"5 (BL=1)"},
                {"sub":6,"id":6,"score":-1,"ylabel":"6 (BL=3)"},
                {"sub":8,"id":7,"score":-1,"ylabel":"7 (BL=2)"},
                {"sub":9,"id":8,"score":1,"ylabel":"8 (BL=3)"},
                {"sub":10,"id":9,"score":0,"ylabel":"9 (BL=6)"},
                {"sub":11,"id":10,"score":-1,"ylabel":"10 (BL=3)"},
                {"sub":12,"id":11,"score":-1,"ylabel":"11 (BL=3)"},
                {"sub":13,"id":12,"score":-1,"ylabel":"12 (BL=2)"},
                {"sub":14,"id":13,"score":0,"ylabel":"13 (BL=4)"},
                {"sub":15,"id":14,"score":-1,"ylabel":"14 (BL=4)"},
                {"sub":16,"id":15,"score":0,"ylabel":"15 (BL=3)"},
                {"sub":17,"id":16,"score":-2,"ylabel":"16 (BL=4)"},
                {"sub":18,"id":17,"score":-2,"ylabel":"17 (BL=3)"},
                {"sub":19,"id":18,"score":-1,"ylabel":"18 (BL=3)"},
                {"sub":20,"id":19,"score":-1,"ylabel":"19 (BL=5)"},
                {"sub":21,"id":20,"score":0,"ylabel":"20 (BL=5)"},
                {"sub":22,"id":21,"score":-2,"ylabel":"21 (BL=4)"},
                {"sub":23,"id":22,"score":0,"ylabel":"22(BL=4)"},
                {"sub":24,"id":23,"score":0,"ylabel":"23 (BL=3)"}]

            // ====================================================================================
    var lineData = [{ "x1": 1, "y1": -3, "x2": 1, "y2": -2 },
                    { "x1": 3, "y1": -6, "x2": 3, "y2": -4 },
                    { "x1": 6, "y1": -3, "x2": 6, "y2": -2 },
                    { "x1": 9, "y1": -3, "x2": 9, "y2": -1 },
                    { "x1": 14, "y1": -4, "x2": 14, "y2": -3 },
                    { "x1": 15, "y1": -4, "x2": 15, "y2": -1 },
                    { "x1": 16, "y1": -3, "x2": 16, "y2": -1 },
                    { "x1": 17, "y1": -4, "x2": 17, "y2": -2 },
                    { "x1": 19, "y1": -3, "x2": 19, "y2": -2 },
                    { "x1": 20, "y1": -5, "x2": 20, "y2": 0 },
                    { "x1": 23, "y1": -4, "x2": 23, "y2": -2 },
                    { "x1": 24, "y1": -3, "x2": 24, "y2": -1 }];

            // =========================================================================================================
            
            function drawLines() {
                lineData.forEach(function (elem) {
                    var line1 = svg.append("line")
                        .attr("class", "hlines")
                        .attr("x1", xScale(elem.y1))
                        .attr("y1", yScale(elem.x1))
                        .attr("x2", xScale(elem.y2))
                        .attr("y2", yScale(elem.x2))
                        .attr("stroke-width", 2)
                        .style("z-index", 0)
                        .attr("stroke", "#7CCDD4");
                })
            }; // end of drawLines
            // =========================================================================================================
            // drawLines();
            // =========================================================================================================
            // var bubbleMoveDelay = 2000
            // var bubbleMoveDuration = 2000
            // debugger;

            var tooltip = d3.select('body')
                            .append('div')
                            .attr("class", "tooltip")
                            .style("opacity", 0);

            function drawBubbles() {
                clearElements();
                d3.selectAll(".textBox1").remove();
                updateYAxis(yAgeTicks)

                bubble = svg.selectAll(".allBubbles")
                    .data(bubbleData);

                bubble.exit().remove();

                bubble.enter()
                    .append("circle")

                bubble.transition()
                    // .delay(30000)
                    .duration(function (d, i) {
                        return i * 0
                    })
                    .attr("class", "allBubbles")
                    .attr("cx", function (d) {
                        return xScale(d.score);
                    })
                    .attr("cy", function (d) {
                        return yScale(d.sub);
                    })
                    .attr("r", function (d) {
                        return (6 + (d.count * .7))
                    })
                    .attr("fill", '#7CCDD4')
                    .attr("opacity", 1)
                    .transition().delay(2000).duration(0)
                    .attr("cx", function (d) {
                        return xScale(0);
                    })
                    .transition().delay(3500).duration(2000)
                    .attr("cx", function (d) {
                        return xScale(d.score);
                    })

                // Mouse over function
                bubble.on("mouseover", function (d, i) {

                    tooltip.style("opacity", 1);
                    tooltip.html(" Natural History " + "</br>" + " Pair ID: " + d.id + "</br>" + " n = " + d.count + "<br/>" + "&Delta; = " + d.score)
                        .style("left", d3.event.pageX + "px")
                        .style("top", (d3.event.pageY - 38) + "px")

                })

                    .on("mouseout", function (d) {
                        tooltip.style("opacity", 0);
                    })

                
            }; // end of drawBubbles function

            
        

            // =========================================================================================================
            showBubbleText = function () {
                bubbleText = svg.selectAll(".bubbleText")
                                .data(bubbleData)
                                .enter()
                                .append("text")
                                .text(function (d) { return d.count; })
                                .attr("class", "bubbleText")
                                .attr("x", function (d) { if (d.overlap === 1) { return xScale((d.score) - (-.1)) } else { return xScale(d.score); }})
                                .attr("y", function (d) { return yScale(d.sub); })
                                .attr("dy", "0.3em")
                                .attr("text-anchor", "middle")
                                .style("font-size", "12px")
                                .style("z-index", 0)
                                .attr("opacity", 1)
                        }
            // drawBubbles();

            // =========================================================================================================
            function drawSquares() {
                clearElements();
                // Add the points!
                svg.selectAll(".square")
                    .data(data)
                    .enter().append("path")
                    // .transition().delay(35000).duration(1)
                    .attr("class", "square")
                    .attr("fill", "orange")
                    .attr("d", d3.svg.symbol().type("square"))
                    .attr("transform", function (d) { return "translate(" + xScale(d.score) + "," + yScale(d.sub) + ")"; })
                    // .transition().delay(000).duration(000)
                    .transition().delay(2000).duration(0)
                    .attr("transform", function (d) { return "translate(" + xScale(0) + "," + yScale(d.sub) + ")"; })
                    .transition().delay(5500).duration(2000)
                    .attr("transform", function (d) { return "translate(" + xScale(d.score) + "," + yScale(d.sub) + ")"; })
                    


            }; // end drawSquares()

            yAxixTextTicks = [
                                "1 (BL=3)", 
                                "2 (BL=3)", 
                                "3 (BL=6)", 
                                "4 (BL=3)",
                                "5 (BL=1)", 
                                "6 (BL=3)", 
                                "7 (BL=2)", 
                                "8 (BL=3)", 
                                "9 (BL=6)",
                                "10 (BL=3)", 
                                "11 (BL=3)", 
                                "12 (BL=2)", 
                                "13 (BL=4)", 
                                "14 (BL=4)",
                                "15 (BL=3)", 
                                "16 (BL=4)", 
                                "17 (BL=3)", 
                                "18 (BL=3)", 
                                "19 (BL=5)",
                                "20 (BL=5)", 
                                "21 (BL=4)", 
                                "22(BL=4)", 
                                "23 (BL=3)"
                            ];



            yScale3 = d3.scale.ordinal()
                        // .domain([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23])
                        .domain(d3.range(0,24))
                        // .domain(d3.range[0,24])
                        .rangeRoundBands([m.top, HEIGHT - m.bottom]);

            function yAxisText () {
                 svg.selectAll(".yTexts")
                    .data(yAxixTextTicks)
                    .enter()
                    .append("text")
                    .classed("yTexts", true)
                    .attr("transform", "translate(-10, 0)")
                    .attr("x", function (d) { return xScale(-7)})
                    .attr("y", function(d, i) { return yScale3(i + 1)})
                    .attr("text-anchor", "end") 
                    .style("font-size", function () { if (bigScreen) { return "18px"} else { return "12px"}})
                    .style("fill", "black")
                    .text(function(d, i) { return d});

                }



            fc = function fullChart() {
                d3.selectAll(".hlines").remove();
                d3.selectAll(".square2").remove();
                drawBubbles();
                drawSquares();
                yAxisText();
                setLinesFc = setTimeout(drawLines, 5500);
                // --------------------------
                setSecondSquare = setTimeout(function () {
                    svg.selectAll(".square2")
                    .data(data)
                    .enter().append("path")
                    // .transition().delay(35000).duration(1)
                    .attr("class", "square2")
                    .attr("fill", "orange")
                    .attr("opacity", 0)
                    .attr("d", d3.svg.symbol().type("square"))
                    .attr("transform", function (d) { return "translate(" + xScale(d.score) + "," + yScale(d.sub) + ")"; })
                    .transition().delay(1550)
                    .attr("opacity", 1)
                    .attr("transform", function (d) { return "translate(" + xScale(d.score) + "," + yScale(d.sub) + ")"; })

                // Draw circle on top of square for tooltip purpose    
                squareSymbolTooltip = svg.selectAll(".squareSymbolTooltip")
                        .data(data)
                        .enter()
                        .append("circle")
                        .attr("cx", function (d) {return xScale(d.score)})
                        .attr("cy", function (d) {return yScale(d.sub)})
                        .attr("r", 4)
                        .attr("fill", "orange")
                        .attr("class", "squareSymbolTooltip")
                        // .attr("fill", "none")
                        .on("mouseover", function (d, i) {
                            tooltip.style("opacity", 1);
                            tooltip.html(" Study Patient " + "<br/>" + " ID = " + d.id + "<br/>" + "&Delta; = " + d.score)
                                .style("left", d3.event.pageX + "px")
                                .style("top", (d3.event.pageY - 38) + "px")
                                })

                        .on("mouseout", function (d) {
                            tooltip.style("opacity", 0);
                            })
                }, 7510)
                // --------------------------
                
                showBubbleTextVar = setTimeout(showBubbleText, 5505);
                // drawLines();
                // drawSquares2();
                navbar(1);

                legendBlueBubble = function () {
                    legendBlBubble = svg.selectAll(".allBubbles")
                        .data([10]);

                    legendBlBubble.exit().remove();

                    legendBlBubble.enter()
                        .append("circle")

                    legendBlBubble.transition()
                        // .delay(30000)
                        .duration(function (d, i) {
                            return i * 0
                        })
                        .attr("class", "allBubbles legend")
                        .attr("cx", function (d) {
                            return xScale(-6.5);
                        })
                        .attr("cy", function (d) {
                            return yScale(10);
                        })
                        .attr("r", function (d) {
                            return (8)
                        })
                        .attr("fill", '#7CCDD4')
                        .attr("opacity", 0)
                        .transition().delay(bubbleMoveDelay - 1900).duration(bubbleMoveDuration)
                        .attr("opacity", function () { if (bigScreen) { return 1} else { return 0 }});
                }


                legendBlueBubbleText = function () {
                    svg.append("svg:g")
                    .append("text")
                    .attr("class", "legendText legend")
                    .attr("x", function (d) {
                        return xScale(-6.3);
                    })
                    .attr("y", function (d) {
                        return yScale(10);
                    })
                    .attr("dy", ".35em")
                    .style("font-size", function () { if (window.innerHeight > 400) { return "18px"} else { return "12px"}})
                    .style("text-anchor", "start")
                    .text(function () { if (bigScreen) { return "Natural History Patient's ML Score Change"} else { return "" }})
                    .attr("opacity", 0)
                    .transition().delay(bubbleMoveDelay - 2000).duration(bubbleMoveDuration)
                    .attr("opacity", 1);
                    }


                legendOrangeSquareText = function () {
                    svg.append("svg:g")
                    .append("text")
                    .attr("class", "legendText legend")
                    .attr("x", function (d) {
                        return xScale(-6.3);
                    })
                    .attr("y", function (d) {
                        return yScale(12);
                    })
                    .attr("dy", ".35em")
                    .style("font-size", function () { if (window.innerHeight > 400) { return "18px"} else { return "12px"}})
                    .style("text-anchor", "start")
                    .text(function () { if (bigScreen) { return "BMN-190 Study Patient's ML Score Change"} else { return "" }})
                    .attr("opacity", 0)
                    .transition().delay(bubbleMoveDelay - 2000).duration(bubbleMoveDuration)
                    .attr("opacity", 1)
                }
                

                legendOrangeSquare = function () {
                    svg.selectAll(".squareLegend")
                    .data([10])
                    .enter().append("path")
                    .attr("class", "squareLegend legend")
                    .attr("fill", "orange")
                    .attr("d", d3.svg.symbol().type("square"))
                    .attr("transform", function (d) { return "translate(" + xScale(-6.5) + "," + yScale(12) + ")"; })
                    .attr("opacity", 0)
                    .transition().delay(bubbleMoveDelay - 2000).duration(bubbleMoveDuration)
                    .attr("opacity", function () { if (bigScreen) { return 1} else { return 0 }});
                };

            legendOrangeSquareText();
            legendBlueBubbleText();
            legendOrangeSquare();
            legendBlueBubble();

            }; // end function fc

            

            fc(); //diabled for dev + debugging

            // =========================================================================================================


    //     }) // end square.csv
    // }) //end bubble.csv
    // };

      
  </script>
  </div>
</body>
</html>
