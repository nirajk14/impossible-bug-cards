extends Node

var CardA:= false
var CardB:=false
var CardC:= false
var zawarudoM:=0.0
var zawarudoA:=0.0
var adder:=0.0

func CardA_acquired():
	CardA=true
func CardB_acquired():
	CardB=true
func CardC_acquired():
	CardC=true

func zawarudoactivate():
	zawarudoM=1
	zawarudoA =adder
	adder+=0.021

func zawarudodeactivate():
	zawarudoA=0
	zawarudoM=0

