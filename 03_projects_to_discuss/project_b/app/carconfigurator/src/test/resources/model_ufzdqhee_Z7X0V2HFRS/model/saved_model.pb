��
��
B
AssignVariableOp
resource
value"dtype"
dtypetype�
~
BiasAdd

value"T	
bias"T
output"T" 
Ttype:
2	"-
data_formatstringNHWC:
NHWCNCHW
h
ConcatV2
values"T*N
axis"Tidx
output"T"
Nint(0"	
Ttype"
Tidxtype0:
2	
8
Const
output"dtype"
valuetensor"
dtypetype
.
Identity

input"T
output"T"	
Ttype
q
MatMul
a"T
b"T
product"T"
transpose_abool( "
transpose_bbool( "
Ttype:

2	
e
MergeV2Checkpoints
checkpoint_prefixes
destination_prefix"
delete_old_dirsbool(�
?
Mul
x"T
y"T
z"T"
Ttype:
2	�

NoOp
M
Pack
values"T*N
output"T"
Nint(0"	
Ttype"
axisint 
C
Placeholder
output"dtype"
dtypetype"
shapeshape:
@
ReadVariableOp
resource
value"dtype"
dtypetype�
E
Relu
features"T
activations"T"
Ttype:
2	
o
	RestoreV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
l
SaveV2

prefix
tensor_names
shape_and_slices
tensors2dtypes"
dtypes
list(type)(0�
?
Select
	condition

t"T
e"T
output"T"	
Ttype
H
ShardedFilename
basename	
shard

num_shards
filename
0
Sigmoid
x"T
y"T"
Ttype:

2
�
StatefulPartitionedCall
args2Tin
output2Tout"
Tin
list(type)("
Tout
list(type)("	
ffunc"
configstring "
config_protostring "
executor_typestring �
@
StaticRegexFullMatch	
input

output
"
patternstring
N

StringJoin
inputs*N

output"
Nint(0"
	separatorstring 
�
VarHandleOp
resource"
	containerstring "
shared_namestring "
dtypetype"
shapeshape"#
allowed_deviceslist(string)
 �"serve*2.6.02unknown8��
{
mlp_user/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� * 
shared_namemlp_user/kernel
t
#mlp_user/kernel/Read/ReadVariableOpReadVariableOpmlp_user/kernel*
_output_shapes
:	� *
dtype0
r
mlp_user/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namemlp_user/bias
k
!mlp_user/bias/Read/ReadVariableOpReadVariableOpmlp_user/bias*
_output_shapes
: *
dtype0
{
mlp_item/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� * 
shared_namemlp_item/kernel
t
#mlp_item/kernel/Read/ReadVariableOpReadVariableOpmlp_item/kernel*
_output_shapes
:	� *
dtype0
r
mlp_item/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namemlp_item/bias
k
!mlp_item/bias/Read/ReadVariableOpReadVariableOpmlp_item/bias*
_output_shapes
: *
dtype0
v
layer0/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*
shared_namelayer0/kernel
o
!layer0/kernel/Read/ReadVariableOpReadVariableOplayer0/kernel*
_output_shapes

:@@*
dtype0
n
layer0/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*
shared_namelayer0/bias
g
layer0/bias/Read/ReadVariableOpReadVariableOplayer0/bias*
_output_shapes
:@*
dtype0
v
layer1/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *
shared_namelayer1/kernel
o
!layer1/kernel/Read/ReadVariableOpReadVariableOplayer1/kernel*
_output_shapes

:@ *
dtype0
n
layer1/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namelayer1/bias
g
layer1/bias/Read/ReadVariableOpReadVariableOplayer1/bias*
_output_shapes
: *
dtype0
y
mf_user/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*
shared_namemf_user/kernel
r
"mf_user/kernel/Read/ReadVariableOpReadVariableOpmf_user/kernel*
_output_shapes
:	�*
dtype0
p
mf_user/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namemf_user/bias
i
 mf_user/bias/Read/ReadVariableOpReadVariableOpmf_user/bias*
_output_shapes
:*
dtype0
y
mf_item/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*
shared_namemf_item/kernel
r
"mf_item/kernel/Read/ReadVariableOpReadVariableOpmf_item/kernel*
_output_shapes
:	�*
dtype0
p
mf_item/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namemf_item/bias
i
 mf_item/bias/Read/ReadVariableOpReadVariableOpmf_item/bias*
_output_shapes
:*
dtype0
v
layer2/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *
shared_namelayer2/kernel
o
!layer2/kernel/Read/ReadVariableOpReadVariableOplayer2/kernel*
_output_shapes

: *
dtype0
n
layer2/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namelayer2/bias
g
layer2/bias/Read/ReadVariableOpReadVariableOplayer2/bias*
_output_shapes
:*
dtype0
v
layer3/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*
shared_namelayer3/kernel
o
!layer3/kernel/Read/ReadVariableOpReadVariableOplayer3/kernel*
_output_shapes

:*
dtype0
n
layer3/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_namelayer3/bias
g
layer3/bias/Read/ReadVariableOpReadVariableOplayer3/bias*
_output_shapes
:*
dtype0
~
prediction/kernelVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*"
shared_nameprediction/kernel
w
%prediction/kernel/Read/ReadVariableOpReadVariableOpprediction/kernel*
_output_shapes

:*
dtype0
v
prediction/biasVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_nameprediction/bias
o
#prediction/bias/Read/ReadVariableOpReadVariableOpprediction/bias*
_output_shapes
:*
dtype0
f
	Adam/iterVarHandleOp*
_output_shapes
: *
dtype0	*
shape: *
shared_name	Adam/iter
_
Adam/iter/Read/ReadVariableOpReadVariableOp	Adam/iter*
_output_shapes
: *
dtype0	
j
Adam/beta_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_1
c
Adam/beta_1/Read/ReadVariableOpReadVariableOpAdam/beta_1*
_output_shapes
: *
dtype0
j
Adam/beta_2VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nameAdam/beta_2
c
Adam/beta_2/Read/ReadVariableOpReadVariableOpAdam/beta_2*
_output_shapes
: *
dtype0
h

Adam/decayVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name
Adam/decay
a
Adam/decay/Read/ReadVariableOpReadVariableOp
Adam/decay*
_output_shapes
: *
dtype0
x
Adam/learning_rateVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/learning_rate
q
&Adam/learning_rate/Read/ReadVariableOpReadVariableOpAdam/learning_rate*
_output_shapes
: *
dtype0
^
totalVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_nametotal
W
total/Read/ReadVariableOpReadVariableOptotal*
_output_shapes
: *
dtype0
^
countVarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_namecount
W
count/Read/ReadVariableOpReadVariableOpcount*
_output_shapes
: *
dtype0
b
total_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	total_1
[
total_1/Read/ReadVariableOpReadVariableOptotal_1*
_output_shapes
: *
dtype0
b
count_1VarHandleOp*
_output_shapes
: *
dtype0*
shape: *
shared_name	count_1
[
count_1/Read/ReadVariableOpReadVariableOpcount_1*
_output_shapes
: *
dtype0
t
true_positivesVarHandleOp*
_output_shapes
: *
dtype0*
shape:*
shared_nametrue_positives
m
"true_positives/Read/ReadVariableOpReadVariableOptrue_positives*
_output_shapes
:*
dtype0
v
false_negativesVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_namefalse_negatives
o
#false_negatives/Read/ReadVariableOpReadVariableOpfalse_negatives*
_output_shapes
:*
dtype0
x
true_positives_1VarHandleOp*
_output_shapes
: *
dtype0*
shape:*!
shared_nametrue_positives_1
q
$true_positives_1/Read/ReadVariableOpReadVariableOptrue_positives_1*
_output_shapes
:*
dtype0
v
false_positivesVarHandleOp*
_output_shapes
: *
dtype0*
shape:* 
shared_namefalse_positives
o
#false_positives/Read/ReadVariableOpReadVariableOpfalse_positives*
_output_shapes
:*
dtype0
�
Adam/mlp_user/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *'
shared_nameAdam/mlp_user/kernel/m
�
*Adam/mlp_user/kernel/m/Read/ReadVariableOpReadVariableOpAdam/mlp_user/kernel/m*
_output_shapes
:	� *
dtype0
�
Adam/mlp_user/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/mlp_user/bias/m
y
(Adam/mlp_user/bias/m/Read/ReadVariableOpReadVariableOpAdam/mlp_user/bias/m*
_output_shapes
: *
dtype0
�
Adam/mlp_item/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *'
shared_nameAdam/mlp_item/kernel/m
�
*Adam/mlp_item/kernel/m/Read/ReadVariableOpReadVariableOpAdam/mlp_item/kernel/m*
_output_shapes
:	� *
dtype0
�
Adam/mlp_item/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/mlp_item/bias/m
y
(Adam/mlp_item/bias/m/Read/ReadVariableOpReadVariableOpAdam/mlp_item/bias/m*
_output_shapes
: *
dtype0
�
Adam/layer0/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*%
shared_nameAdam/layer0/kernel/m
}
(Adam/layer0/kernel/m/Read/ReadVariableOpReadVariableOpAdam/layer0/kernel/m*
_output_shapes

:@@*
dtype0
|
Adam/layer0/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*#
shared_nameAdam/layer0/bias/m
u
&Adam/layer0/bias/m/Read/ReadVariableOpReadVariableOpAdam/layer0/bias/m*
_output_shapes
:@*
dtype0
�
Adam/layer1/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *%
shared_nameAdam/layer1/kernel/m
}
(Adam/layer1/kernel/m/Read/ReadVariableOpReadVariableOpAdam/layer1/kernel/m*
_output_shapes

:@ *
dtype0
|
Adam/layer1/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/layer1/bias/m
u
&Adam/layer1/bias/m/Read/ReadVariableOpReadVariableOpAdam/layer1/bias/m*
_output_shapes
: *
dtype0
�
Adam/mf_user/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*&
shared_nameAdam/mf_user/kernel/m
�
)Adam/mf_user/kernel/m/Read/ReadVariableOpReadVariableOpAdam/mf_user/kernel/m*
_output_shapes
:	�*
dtype0
~
Adam/mf_user/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/mf_user/bias/m
w
'Adam/mf_user/bias/m/Read/ReadVariableOpReadVariableOpAdam/mf_user/bias/m*
_output_shapes
:*
dtype0
�
Adam/mf_item/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*&
shared_nameAdam/mf_item/kernel/m
�
)Adam/mf_item/kernel/m/Read/ReadVariableOpReadVariableOpAdam/mf_item/kernel/m*
_output_shapes
:	�*
dtype0
~
Adam/mf_item/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/mf_item/bias/m
w
'Adam/mf_item/bias/m/Read/ReadVariableOpReadVariableOpAdam/mf_item/bias/m*
_output_shapes
:*
dtype0
�
Adam/layer2/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *%
shared_nameAdam/layer2/kernel/m
}
(Adam/layer2/kernel/m/Read/ReadVariableOpReadVariableOpAdam/layer2/kernel/m*
_output_shapes

: *
dtype0
|
Adam/layer2/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/layer2/bias/m
u
&Adam/layer2/bias/m/Read/ReadVariableOpReadVariableOpAdam/layer2/bias/m*
_output_shapes
:*
dtype0
�
Adam/layer3/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/layer3/kernel/m
}
(Adam/layer3/kernel/m/Read/ReadVariableOpReadVariableOpAdam/layer3/kernel/m*
_output_shapes

:*
dtype0
|
Adam/layer3/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/layer3/bias/m
u
&Adam/layer3/bias/m/Read/ReadVariableOpReadVariableOpAdam/layer3/bias/m*
_output_shapes
:*
dtype0
�
Adam/prediction/kernel/mVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*)
shared_nameAdam/prediction/kernel/m
�
,Adam/prediction/kernel/m/Read/ReadVariableOpReadVariableOpAdam/prediction/kernel/m*
_output_shapes

:*
dtype0
�
Adam/prediction/bias/mVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/prediction/bias/m
}
*Adam/prediction/bias/m/Read/ReadVariableOpReadVariableOpAdam/prediction/bias/m*
_output_shapes
:*
dtype0
�
Adam/mlp_user/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *'
shared_nameAdam/mlp_user/kernel/v
�
*Adam/mlp_user/kernel/v/Read/ReadVariableOpReadVariableOpAdam/mlp_user/kernel/v*
_output_shapes
:	� *
dtype0
�
Adam/mlp_user/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/mlp_user/bias/v
y
(Adam/mlp_user/bias/v/Read/ReadVariableOpReadVariableOpAdam/mlp_user/bias/v*
_output_shapes
: *
dtype0
�
Adam/mlp_item/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	� *'
shared_nameAdam/mlp_item/kernel/v
�
*Adam/mlp_item/kernel/v/Read/ReadVariableOpReadVariableOpAdam/mlp_item/kernel/v*
_output_shapes
:	� *
dtype0
�
Adam/mlp_item/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *%
shared_nameAdam/mlp_item/bias/v
y
(Adam/mlp_item/bias/v/Read/ReadVariableOpReadVariableOpAdam/mlp_item/bias/v*
_output_shapes
: *
dtype0
�
Adam/layer0/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@@*%
shared_nameAdam/layer0/kernel/v
}
(Adam/layer0/kernel/v/Read/ReadVariableOpReadVariableOpAdam/layer0/kernel/v*
_output_shapes

:@@*
dtype0
|
Adam/layer0/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:@*#
shared_nameAdam/layer0/bias/v
u
&Adam/layer0/bias/v/Read/ReadVariableOpReadVariableOpAdam/layer0/bias/v*
_output_shapes
:@*
dtype0
�
Adam/layer1/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:@ *%
shared_nameAdam/layer1/kernel/v
}
(Adam/layer1/kernel/v/Read/ReadVariableOpReadVariableOpAdam/layer1/kernel/v*
_output_shapes

:@ *
dtype0
|
Adam/layer1/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape: *#
shared_nameAdam/layer1/bias/v
u
&Adam/layer1/bias/v/Read/ReadVariableOpReadVariableOpAdam/layer1/bias/v*
_output_shapes
: *
dtype0
�
Adam/mf_user/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*&
shared_nameAdam/mf_user/kernel/v
�
)Adam/mf_user/kernel/v/Read/ReadVariableOpReadVariableOpAdam/mf_user/kernel/v*
_output_shapes
:	�*
dtype0
~
Adam/mf_user/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/mf_user/bias/v
w
'Adam/mf_user/bias/v/Read/ReadVariableOpReadVariableOpAdam/mf_user/bias/v*
_output_shapes
:*
dtype0
�
Adam/mf_item/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:	�*&
shared_nameAdam/mf_item/kernel/v
�
)Adam/mf_item/kernel/v/Read/ReadVariableOpReadVariableOpAdam/mf_item/kernel/v*
_output_shapes
:	�*
dtype0
~
Adam/mf_item/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*$
shared_nameAdam/mf_item/bias/v
w
'Adam/mf_item/bias/v/Read/ReadVariableOpReadVariableOpAdam/mf_item/bias/v*
_output_shapes
:*
dtype0
�
Adam/layer2/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
: *%
shared_nameAdam/layer2/kernel/v
}
(Adam/layer2/kernel/v/Read/ReadVariableOpReadVariableOpAdam/layer2/kernel/v*
_output_shapes

: *
dtype0
|
Adam/layer2/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/layer2/bias/v
u
&Adam/layer2/bias/v/Read/ReadVariableOpReadVariableOpAdam/layer2/bias/v*
_output_shapes
:*
dtype0
�
Adam/layer3/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*%
shared_nameAdam/layer3/kernel/v
}
(Adam/layer3/kernel/v/Read/ReadVariableOpReadVariableOpAdam/layer3/kernel/v*
_output_shapes

:*
dtype0
|
Adam/layer3/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*#
shared_nameAdam/layer3/bias/v
u
&Adam/layer3/bias/v/Read/ReadVariableOpReadVariableOpAdam/layer3/bias/v*
_output_shapes
:*
dtype0
�
Adam/prediction/kernel/vVarHandleOp*
_output_shapes
: *
dtype0*
shape
:*)
shared_nameAdam/prediction/kernel/v
�
,Adam/prediction/kernel/v/Read/ReadVariableOpReadVariableOpAdam/prediction/kernel/v*
_output_shapes

:*
dtype0
�
Adam/prediction/bias/vVarHandleOp*
_output_shapes
: *
dtype0*
shape:*'
shared_nameAdam/prediction/bias/v
}
*Adam/prediction/bias/v/Read/ReadVariableOpReadVariableOpAdam/prediction/bias/v*
_output_shapes
:*
dtype0

NoOpNoOp
�i
ConstConst"/device:CPU:0*
_output_shapes
: *
dtype0*�h
value�hB�h B�h
�
layer-0
layer-1
layer-2
layer_with_weights-0
layer-3
layer_with_weights-1
layer-4
layer-5
layer_with_weights-2
layer-6
layer_with_weights-3
layer-7
	layer_with_weights-4
	layer-8

layer_with_weights-5

layer-9
layer_with_weights-6
layer-10
layer-11
layer_with_weights-7
layer-12
layer-13
layer_with_weights-8
layer-14
	optimizer
	variables
regularization_losses
trainable_variables
	keras_api

signatures
 
R
	variables
regularization_losses
trainable_variables
	keras_api
 
h

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
h

 kernel
!bias
"	variables
#regularization_losses
$trainable_variables
%	keras_api
R
&	variables
'regularization_losses
(trainable_variables
)	keras_api
h

*kernel
+bias
,	variables
-regularization_losses
.trainable_variables
/	keras_api
h

0kernel
1bias
2	variables
3regularization_losses
4trainable_variables
5	keras_api
h

6kernel
7bias
8	variables
9regularization_losses
:trainable_variables
;	keras_api
h

<kernel
=bias
>	variables
?regularization_losses
@trainable_variables
A	keras_api
h

Bkernel
Cbias
D	variables
Eregularization_losses
Ftrainable_variables
G	keras_api
R
H	variables
Iregularization_losses
Jtrainable_variables
K	keras_api
h

Lkernel
Mbias
N	variables
Oregularization_losses
Ptrainable_variables
Q	keras_api
R
R	variables
Sregularization_losses
Ttrainable_variables
U	keras_api
h

Vkernel
Wbias
X	variables
Yregularization_losses
Ztrainable_variables
[	keras_api
�
\iter

]beta_1

^beta_2
	_decay
`learning_ratem�m� m�!m�*m�+m�0m�1m�6m�7m�<m�=m�Bm�Cm�Lm�Mm�Vm�Wm�v�v� v�!v�*v�+v�0v�1v�6v�7v�<v�=v�Bv�Cv�Lv�Mv�Vv�Wv�
�
0
1
 2
!3
*4
+5
06
17
68
79
<10
=11
B12
C13
L14
M15
V16
W17
 
�
0
1
 2
!3
*4
+5
06
17
68
79
<10
=11
B12
C13
L14
M15
V16
W17
�
	variables

alayers
blayer_regularization_losses
regularization_losses
cnon_trainable_variables
dmetrics
trainable_variables
elayer_metrics
 
 
 
 
�
	variables

flayers
glayer_regularization_losses
regularization_losses
hnon_trainable_variables
imetrics
trainable_variables
jlayer_metrics
[Y
VARIABLE_VALUEmlp_user/kernel6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEmlp_user/bias4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUE

0
1
 

0
1
�
	variables

klayers
llayer_regularization_losses
regularization_losses
mnon_trainable_variables
nmetrics
trainable_variables
olayer_metrics
[Y
VARIABLE_VALUEmlp_item/kernel6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUE
WU
VARIABLE_VALUEmlp_item/bias4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUE

 0
!1
 

 0
!1
�
"	variables

players
qlayer_regularization_losses
#regularization_losses
rnon_trainable_variables
smetrics
$trainable_variables
tlayer_metrics
 
 
 
�
&	variables

ulayers
vlayer_regularization_losses
'regularization_losses
wnon_trainable_variables
xmetrics
(trainable_variables
ylayer_metrics
YW
VARIABLE_VALUElayer0/kernel6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer0/bias4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUE

*0
+1
 

*0
+1
�
,	variables

zlayers
{layer_regularization_losses
-regularization_losses
|non_trainable_variables
}metrics
.trainable_variables
~layer_metrics
YW
VARIABLE_VALUElayer1/kernel6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer1/bias4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUE

00
11
 

00
11
�
2	variables

layers
 �layer_regularization_losses
3regularization_losses
�non_trainable_variables
�metrics
4trainable_variables
�layer_metrics
ZX
VARIABLE_VALUEmf_user/kernel6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEmf_user/bias4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUE

60
71
 

60
71
�
8	variables
�layers
 �layer_regularization_losses
9regularization_losses
�non_trainable_variables
�metrics
:trainable_variables
�layer_metrics
ZX
VARIABLE_VALUEmf_item/kernel6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUE
VT
VARIABLE_VALUEmf_item/bias4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUE

<0
=1
 

<0
=1
�
>	variables
�layers
 �layer_regularization_losses
?regularization_losses
�non_trainable_variables
�metrics
@trainable_variables
�layer_metrics
YW
VARIABLE_VALUElayer2/kernel6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer2/bias4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUE

B0
C1
 

B0
C1
�
D	variables
�layers
 �layer_regularization_losses
Eregularization_losses
�non_trainable_variables
�metrics
Ftrainable_variables
�layer_metrics
 
 
 
�
H	variables
�layers
 �layer_regularization_losses
Iregularization_losses
�non_trainable_variables
�metrics
Jtrainable_variables
�layer_metrics
YW
VARIABLE_VALUElayer3/kernel6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUE
US
VARIABLE_VALUElayer3/bias4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUE

L0
M1
 

L0
M1
�
N	variables
�layers
 �layer_regularization_losses
Oregularization_losses
�non_trainable_variables
�metrics
Ptrainable_variables
�layer_metrics
 
 
 
�
R	variables
�layers
 �layer_regularization_losses
Sregularization_losses
�non_trainable_variables
�metrics
Ttrainable_variables
�layer_metrics
][
VARIABLE_VALUEprediction/kernel6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUE
YW
VARIABLE_VALUEprediction/bias4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUE

V0
W1
 

V0
W1
�
X	variables
�layers
 �layer_regularization_losses
Yregularization_losses
�non_trainable_variables
�metrics
Ztrainable_variables
�layer_metrics
HF
VARIABLE_VALUE	Adam/iter)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_1+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUE
LJ
VARIABLE_VALUEAdam/beta_2+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUE
JH
VARIABLE_VALUE
Adam/decay*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUE
ZX
VARIABLE_VALUEAdam/learning_rate2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUE
n
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14
 
 
 
�0
�1
�2
�3
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
8

�total

�count
�	variables
�	keras_api
I

�total

�count
�
_fn_kwargs
�	variables
�	keras_api
\
�
thresholds
�true_positives
�false_negatives
�	variables
�	keras_api
\
�
thresholds
�true_positives
�false_positives
�	variables
�	keras_api
OM
VARIABLE_VALUEtotal4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUE
OM
VARIABLE_VALUEcount4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�	variables
QO
VARIABLE_VALUEtotal_14keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUE
QO
VARIABLE_VALUEcount_14keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUE
 

�0
�1

�	variables
 
a_
VARIABLE_VALUEtrue_positives=keras_api/metrics/2/true_positives/.ATTRIBUTES/VARIABLE_VALUE
ca
VARIABLE_VALUEfalse_negatives>keras_api/metrics/2/false_negatives/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�	variables
 
ca
VARIABLE_VALUEtrue_positives_1=keras_api/metrics/3/true_positives/.ATTRIBUTES/VARIABLE_VALUE
ca
VARIABLE_VALUEfalse_positives>keras_api/metrics/3/false_positives/.ATTRIBUTES/VARIABLE_VALUE

�0
�1

�	variables
~|
VARIABLE_VALUEAdam/mlp_user/kernel/mRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/mlp_user/bias/mPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/mlp_item/kernel/mRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/mlp_item/bias/mPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer0/kernel/mRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer0/bias/mPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer1/kernel/mRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer1/bias/mPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/mf_user/kernel/mRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/mf_user/bias/mPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/mf_item/kernel/mRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/mf_item/bias/mPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer2/kernel/mRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer2/bias/mPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer3/kernel/mRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer3/bias/mPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUEAdam/prediction/kernel/mRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/prediction/bias/mPlayer_with_weights-8/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/mlp_user/kernel/vRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/mlp_user/bias/vPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
~|
VARIABLE_VALUEAdam/mlp_item/kernel/vRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
zx
VARIABLE_VALUEAdam/mlp_item/bias/vPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer0/kernel/vRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer0/bias/vPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer1/kernel/vRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer1/bias/vPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/mf_user/kernel/vRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/mf_user/bias/vPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
}{
VARIABLE_VALUEAdam/mf_item/kernel/vRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
yw
VARIABLE_VALUEAdam/mf_item/bias/vPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer2/kernel/vRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer2/bias/vPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/layer3/kernel/vRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
xv
VARIABLE_VALUEAdam/layer3/bias/vPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
�~
VARIABLE_VALUEAdam/prediction/kernel/vRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|z
VARIABLE_VALUEAdam/prediction/bias/vPlayer_with_weights-8/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUE
|
serving_default_input_1Placeholder*(
_output_shapes
:����������*
dtype0*
shape:����������
|
serving_default_input_2Placeholder*(
_output_shapes
:����������*
dtype0*
shape:����������
�
StatefulPartitionedCallStatefulPartitionedCallserving_default_input_1serving_default_input_2mlp_user/kernelmlp_user/biasmlp_item/kernelmlp_item/biaslayer0/kernellayer0/biaslayer1/kernellayer1/biaslayer2/kernellayer2/biasmf_user/kernelmf_user/biasmf_item/kernelmf_item/biaslayer3/kernellayer3/biasprediction/kernelprediction/bias*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *-
f(R&
$__inference_signature_wrapper_211448
O
saver_filenamePlaceholder*
_output_shapes
: *
dtype0*
shape: 
�
StatefulPartitionedCall_1StatefulPartitionedCallsaver_filename#mlp_user/kernel/Read/ReadVariableOp!mlp_user/bias/Read/ReadVariableOp#mlp_item/kernel/Read/ReadVariableOp!mlp_item/bias/Read/ReadVariableOp!layer0/kernel/Read/ReadVariableOplayer0/bias/Read/ReadVariableOp!layer1/kernel/Read/ReadVariableOplayer1/bias/Read/ReadVariableOp"mf_user/kernel/Read/ReadVariableOp mf_user/bias/Read/ReadVariableOp"mf_item/kernel/Read/ReadVariableOp mf_item/bias/Read/ReadVariableOp!layer2/kernel/Read/ReadVariableOplayer2/bias/Read/ReadVariableOp!layer3/kernel/Read/ReadVariableOplayer3/bias/Read/ReadVariableOp%prediction/kernel/Read/ReadVariableOp#prediction/bias/Read/ReadVariableOpAdam/iter/Read/ReadVariableOpAdam/beta_1/Read/ReadVariableOpAdam/beta_2/Read/ReadVariableOpAdam/decay/Read/ReadVariableOp&Adam/learning_rate/Read/ReadVariableOptotal/Read/ReadVariableOpcount/Read/ReadVariableOptotal_1/Read/ReadVariableOpcount_1/Read/ReadVariableOp"true_positives/Read/ReadVariableOp#false_negatives/Read/ReadVariableOp$true_positives_1/Read/ReadVariableOp#false_positives/Read/ReadVariableOp*Adam/mlp_user/kernel/m/Read/ReadVariableOp(Adam/mlp_user/bias/m/Read/ReadVariableOp*Adam/mlp_item/kernel/m/Read/ReadVariableOp(Adam/mlp_item/bias/m/Read/ReadVariableOp(Adam/layer0/kernel/m/Read/ReadVariableOp&Adam/layer0/bias/m/Read/ReadVariableOp(Adam/layer1/kernel/m/Read/ReadVariableOp&Adam/layer1/bias/m/Read/ReadVariableOp)Adam/mf_user/kernel/m/Read/ReadVariableOp'Adam/mf_user/bias/m/Read/ReadVariableOp)Adam/mf_item/kernel/m/Read/ReadVariableOp'Adam/mf_item/bias/m/Read/ReadVariableOp(Adam/layer2/kernel/m/Read/ReadVariableOp&Adam/layer2/bias/m/Read/ReadVariableOp(Adam/layer3/kernel/m/Read/ReadVariableOp&Adam/layer3/bias/m/Read/ReadVariableOp,Adam/prediction/kernel/m/Read/ReadVariableOp*Adam/prediction/bias/m/Read/ReadVariableOp*Adam/mlp_user/kernel/v/Read/ReadVariableOp(Adam/mlp_user/bias/v/Read/ReadVariableOp*Adam/mlp_item/kernel/v/Read/ReadVariableOp(Adam/mlp_item/bias/v/Read/ReadVariableOp(Adam/layer0/kernel/v/Read/ReadVariableOp&Adam/layer0/bias/v/Read/ReadVariableOp(Adam/layer1/kernel/v/Read/ReadVariableOp&Adam/layer1/bias/v/Read/ReadVariableOp)Adam/mf_user/kernel/v/Read/ReadVariableOp'Adam/mf_user/bias/v/Read/ReadVariableOp)Adam/mf_item/kernel/v/Read/ReadVariableOp'Adam/mf_item/bias/v/Read/ReadVariableOp(Adam/layer2/kernel/v/Read/ReadVariableOp&Adam/layer2/bias/v/Read/ReadVariableOp(Adam/layer3/kernel/v/Read/ReadVariableOp&Adam/layer3/bias/v/Read/ReadVariableOp,Adam/prediction/kernel/v/Read/ReadVariableOp*Adam/prediction/bias/v/Read/ReadVariableOpConst*P
TinI
G2E	*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *(
f#R!
__inference__traced_save_212437
�
StatefulPartitionedCall_2StatefulPartitionedCallsaver_filenamemlp_user/kernelmlp_user/biasmlp_item/kernelmlp_item/biaslayer0/kernellayer0/biaslayer1/kernellayer1/biasmf_user/kernelmf_user/biasmf_item/kernelmf_item/biaslayer2/kernellayer2/biaslayer3/kernellayer3/biasprediction/kernelprediction/bias	Adam/iterAdam/beta_1Adam/beta_2
Adam/decayAdam/learning_ratetotalcounttotal_1count_1true_positivesfalse_negativestrue_positives_1false_positivesAdam/mlp_user/kernel/mAdam/mlp_user/bias/mAdam/mlp_item/kernel/mAdam/mlp_item/bias/mAdam/layer0/kernel/mAdam/layer0/bias/mAdam/layer1/kernel/mAdam/layer1/bias/mAdam/mf_user/kernel/mAdam/mf_user/bias/mAdam/mf_item/kernel/mAdam/mf_item/bias/mAdam/layer2/kernel/mAdam/layer2/bias/mAdam/layer3/kernel/mAdam/layer3/bias/mAdam/prediction/kernel/mAdam/prediction/bias/mAdam/mlp_user/kernel/vAdam/mlp_user/bias/vAdam/mlp_item/kernel/vAdam/mlp_item/bias/vAdam/layer0/kernel/vAdam/layer0/bias/vAdam/layer1/kernel/vAdam/layer1/bias/vAdam/mf_user/kernel/vAdam/mf_user/bias/vAdam/mf_item/kernel/vAdam/mf_item/bias/vAdam/layer2/kernel/vAdam/layer2/bias/vAdam/layer3/kernel/vAdam/layer3/bias/vAdam/prediction/kernel/vAdam/prediction/bias/v*O
TinH
F2D*
Tout
2*
_collective_manager_ids
 *
_output_shapes
: * 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *+
f&R$
"__inference__traced_restore_212648��
�
�
__inference_loss_fn_7_212212D
6layer3_bias_regularizer_square_readvariableop_resource:
identity��-layer3/bias/Regularizer/Square/ReadVariableOp�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOp6layer3_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/muli
IdentityIdentitylayer3/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity~
NoOpNoOp.^layer3/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp
�
�
__inference_loss_fn_3_212168D
6layer1_bias_regularizer_square_readvariableop_resource: 
identity��-layer1/bias/Regularizer/Square/ReadVariableOp�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOp6layer1_bias_regularizer_square_readvariableop_resource*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/muli
IdentityIdentitylayer1/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity~
NoOpNoOp.^layer1/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp
��
�
__inference__traced_save_212437
file_prefix.
*savev2_mlp_user_kernel_read_readvariableop,
(savev2_mlp_user_bias_read_readvariableop.
*savev2_mlp_item_kernel_read_readvariableop,
(savev2_mlp_item_bias_read_readvariableop,
(savev2_layer0_kernel_read_readvariableop*
&savev2_layer0_bias_read_readvariableop,
(savev2_layer1_kernel_read_readvariableop*
&savev2_layer1_bias_read_readvariableop-
)savev2_mf_user_kernel_read_readvariableop+
'savev2_mf_user_bias_read_readvariableop-
)savev2_mf_item_kernel_read_readvariableop+
'savev2_mf_item_bias_read_readvariableop,
(savev2_layer2_kernel_read_readvariableop*
&savev2_layer2_bias_read_readvariableop,
(savev2_layer3_kernel_read_readvariableop*
&savev2_layer3_bias_read_readvariableop0
,savev2_prediction_kernel_read_readvariableop.
*savev2_prediction_bias_read_readvariableop(
$savev2_adam_iter_read_readvariableop	*
&savev2_adam_beta_1_read_readvariableop*
&savev2_adam_beta_2_read_readvariableop)
%savev2_adam_decay_read_readvariableop1
-savev2_adam_learning_rate_read_readvariableop$
 savev2_total_read_readvariableop$
 savev2_count_read_readvariableop&
"savev2_total_1_read_readvariableop&
"savev2_count_1_read_readvariableop-
)savev2_true_positives_read_readvariableop.
*savev2_false_negatives_read_readvariableop/
+savev2_true_positives_1_read_readvariableop.
*savev2_false_positives_read_readvariableop5
1savev2_adam_mlp_user_kernel_m_read_readvariableop3
/savev2_adam_mlp_user_bias_m_read_readvariableop5
1savev2_adam_mlp_item_kernel_m_read_readvariableop3
/savev2_adam_mlp_item_bias_m_read_readvariableop3
/savev2_adam_layer0_kernel_m_read_readvariableop1
-savev2_adam_layer0_bias_m_read_readvariableop3
/savev2_adam_layer1_kernel_m_read_readvariableop1
-savev2_adam_layer1_bias_m_read_readvariableop4
0savev2_adam_mf_user_kernel_m_read_readvariableop2
.savev2_adam_mf_user_bias_m_read_readvariableop4
0savev2_adam_mf_item_kernel_m_read_readvariableop2
.savev2_adam_mf_item_bias_m_read_readvariableop3
/savev2_adam_layer2_kernel_m_read_readvariableop1
-savev2_adam_layer2_bias_m_read_readvariableop3
/savev2_adam_layer3_kernel_m_read_readvariableop1
-savev2_adam_layer3_bias_m_read_readvariableop7
3savev2_adam_prediction_kernel_m_read_readvariableop5
1savev2_adam_prediction_bias_m_read_readvariableop5
1savev2_adam_mlp_user_kernel_v_read_readvariableop3
/savev2_adam_mlp_user_bias_v_read_readvariableop5
1savev2_adam_mlp_item_kernel_v_read_readvariableop3
/savev2_adam_mlp_item_bias_v_read_readvariableop3
/savev2_adam_layer0_kernel_v_read_readvariableop1
-savev2_adam_layer0_bias_v_read_readvariableop3
/savev2_adam_layer1_kernel_v_read_readvariableop1
-savev2_adam_layer1_bias_v_read_readvariableop4
0savev2_adam_mf_user_kernel_v_read_readvariableop2
.savev2_adam_mf_user_bias_v_read_readvariableop4
0savev2_adam_mf_item_kernel_v_read_readvariableop2
.savev2_adam_mf_item_bias_v_read_readvariableop3
/savev2_adam_layer2_kernel_v_read_readvariableop1
-savev2_adam_layer2_bias_v_read_readvariableop3
/savev2_adam_layer3_kernel_v_read_readvariableop1
-savev2_adam_layer3_bias_v_read_readvariableop7
3savev2_adam_prediction_kernel_v_read_readvariableop5
1savev2_adam_prediction_bias_v_read_readvariableop
savev2_const

identity_1��MergeV2Checkpoints�
StaticRegexFullMatchStaticRegexFullMatchfile_prefix"/device:CPU:**
_output_shapes
: *
pattern
^s3://.*2
StaticRegexFullMatchc
ConstConst"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B.part2
Constl
Const_1Const"/device:CPU:**
_output_shapes
: *
dtype0*
valueB B
_temp/part2	
Const_1�
SelectSelectStaticRegexFullMatch:output:0Const:output:0Const_1:output:0"/device:CPU:**
T0*
_output_shapes
: 2
Selectt

StringJoin
StringJoinfile_prefixSelect:output:0"/device:CPU:**
N*
_output_shapes
: 2

StringJoinZ

num_shardsConst*
_output_shapes
: *
dtype0*
value	B :2

num_shards
ShardedFilename/shardConst"/device:CPU:0*
_output_shapes
: *
dtype0*
value	B : 2
ShardedFilename/shard�
ShardedFilenameShardedFilenameStringJoin:output:0ShardedFilename/shard:output:0num_shards:output:0"/device:CPU:0*
_output_shapes
: 2
ShardedFilename�%
SaveV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:D*
dtype0*�$
value�$B�$DB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/2/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/2/false_negatives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/3/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/3/false_positives/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-8/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-8/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
SaveV2/tensor_names�
SaveV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:D*
dtype0*�
value�B�DB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
SaveV2/shape_and_slices�
SaveV2SaveV2ShardedFilename:filename:0SaveV2/tensor_names:output:0 SaveV2/shape_and_slices:output:0*savev2_mlp_user_kernel_read_readvariableop(savev2_mlp_user_bias_read_readvariableop*savev2_mlp_item_kernel_read_readvariableop(savev2_mlp_item_bias_read_readvariableop(savev2_layer0_kernel_read_readvariableop&savev2_layer0_bias_read_readvariableop(savev2_layer1_kernel_read_readvariableop&savev2_layer1_bias_read_readvariableop)savev2_mf_user_kernel_read_readvariableop'savev2_mf_user_bias_read_readvariableop)savev2_mf_item_kernel_read_readvariableop'savev2_mf_item_bias_read_readvariableop(savev2_layer2_kernel_read_readvariableop&savev2_layer2_bias_read_readvariableop(savev2_layer3_kernel_read_readvariableop&savev2_layer3_bias_read_readvariableop,savev2_prediction_kernel_read_readvariableop*savev2_prediction_bias_read_readvariableop$savev2_adam_iter_read_readvariableop&savev2_adam_beta_1_read_readvariableop&savev2_adam_beta_2_read_readvariableop%savev2_adam_decay_read_readvariableop-savev2_adam_learning_rate_read_readvariableop savev2_total_read_readvariableop savev2_count_read_readvariableop"savev2_total_1_read_readvariableop"savev2_count_1_read_readvariableop)savev2_true_positives_read_readvariableop*savev2_false_negatives_read_readvariableop+savev2_true_positives_1_read_readvariableop*savev2_false_positives_read_readvariableop1savev2_adam_mlp_user_kernel_m_read_readvariableop/savev2_adam_mlp_user_bias_m_read_readvariableop1savev2_adam_mlp_item_kernel_m_read_readvariableop/savev2_adam_mlp_item_bias_m_read_readvariableop/savev2_adam_layer0_kernel_m_read_readvariableop-savev2_adam_layer0_bias_m_read_readvariableop/savev2_adam_layer1_kernel_m_read_readvariableop-savev2_adam_layer1_bias_m_read_readvariableop0savev2_adam_mf_user_kernel_m_read_readvariableop.savev2_adam_mf_user_bias_m_read_readvariableop0savev2_adam_mf_item_kernel_m_read_readvariableop.savev2_adam_mf_item_bias_m_read_readvariableop/savev2_adam_layer2_kernel_m_read_readvariableop-savev2_adam_layer2_bias_m_read_readvariableop/savev2_adam_layer3_kernel_m_read_readvariableop-savev2_adam_layer3_bias_m_read_readvariableop3savev2_adam_prediction_kernel_m_read_readvariableop1savev2_adam_prediction_bias_m_read_readvariableop1savev2_adam_mlp_user_kernel_v_read_readvariableop/savev2_adam_mlp_user_bias_v_read_readvariableop1savev2_adam_mlp_item_kernel_v_read_readvariableop/savev2_adam_mlp_item_bias_v_read_readvariableop/savev2_adam_layer0_kernel_v_read_readvariableop-savev2_adam_layer0_bias_v_read_readvariableop/savev2_adam_layer1_kernel_v_read_readvariableop-savev2_adam_layer1_bias_v_read_readvariableop0savev2_adam_mf_user_kernel_v_read_readvariableop.savev2_adam_mf_user_bias_v_read_readvariableop0savev2_adam_mf_item_kernel_v_read_readvariableop.savev2_adam_mf_item_bias_v_read_readvariableop/savev2_adam_layer2_kernel_v_read_readvariableop-savev2_adam_layer2_bias_v_read_readvariableop/savev2_adam_layer3_kernel_v_read_readvariableop-savev2_adam_layer3_bias_v_read_readvariableop3savev2_adam_prediction_kernel_v_read_readvariableop1savev2_adam_prediction_bias_v_read_readvariableopsavev2_const"/device:CPU:0*
_output_shapes
 *R
dtypesH
F2D	2
SaveV2�
&MergeV2Checkpoints/checkpoint_prefixesPackShardedFilename:filename:0^SaveV2"/device:CPU:0*
N*
T0*
_output_shapes
:2(
&MergeV2Checkpoints/checkpoint_prefixes�
MergeV2CheckpointsMergeV2Checkpoints/MergeV2Checkpoints/checkpoint_prefixes:output:0file_prefix"/device:CPU:0*
_output_shapes
 2
MergeV2Checkpointsr
IdentityIdentityfile_prefix^MergeV2Checkpoints"/device:CPU:0*
T0*
_output_shapes
: 2

Identity_

Identity_1IdentityIdentity:output:0^NoOp*
T0*
_output_shapes
: 2

Identity_1c
NoOpNoOp^MergeV2Checkpoints*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"!

identity_1Identity_1:output:0*�
_input_shapes�
�: :	� : :	� : :@@:@:@ : :	�::	�:: :::::: : : : : : : : : :::::	� : :	� : :@@:@:@ : :	�::	�:: ::::::	� : :	� : :@@:@:@ : :	�::	�:: :::::: 2(
MergeV2CheckpointsMergeV2Checkpoints:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix:%!

_output_shapes
:	� : 

_output_shapes
: :%!

_output_shapes
:	� : 

_output_shapes
: :$ 

_output_shapes

:@@: 

_output_shapes
:@:$ 

_output_shapes

:@ : 

_output_shapes
: :%	!

_output_shapes
:	�: 


_output_shapes
::%!

_output_shapes
:	�: 

_output_shapes
::$ 

_output_shapes

: : 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::$ 

_output_shapes

:: 

_output_shapes
::

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: :

_output_shapes
: : 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
:: 

_output_shapes
::% !

_output_shapes
:	� : !

_output_shapes
: :%"!

_output_shapes
:	� : #

_output_shapes
: :$$ 

_output_shapes

:@@: %

_output_shapes
:@:$& 

_output_shapes

:@ : '

_output_shapes
: :%(!

_output_shapes
:	�: )

_output_shapes
::%*!

_output_shapes
:	�: +

_output_shapes
::$, 

_output_shapes

: : -

_output_shapes
::$. 

_output_shapes

:: /

_output_shapes
::$0 

_output_shapes

:: 1

_output_shapes
::%2!

_output_shapes
:	� : 3

_output_shapes
: :%4!

_output_shapes
:	� : 5

_output_shapes
: :$6 

_output_shapes

:@@: 7

_output_shapes
:@:$8 

_output_shapes

:@ : 9

_output_shapes
: :%:!

_output_shapes
:	�: ;

_output_shapes
::%<!

_output_shapes
:	�: =

_output_shapes
::$> 

_output_shapes

: : ?

_output_shapes
::$@ 

_output_shapes

:: A

_output_shapes
::$B 

_output_shapes

:: C

_output_shapes
::D

_output_shapes
: 
Ɯ
�(
"__inference__traced_restore_212648
file_prefix3
 assignvariableop_mlp_user_kernel:	� .
 assignvariableop_1_mlp_user_bias: 5
"assignvariableop_2_mlp_item_kernel:	� .
 assignvariableop_3_mlp_item_bias: 2
 assignvariableop_4_layer0_kernel:@@,
assignvariableop_5_layer0_bias:@2
 assignvariableop_6_layer1_kernel:@ ,
assignvariableop_7_layer1_bias: 4
!assignvariableop_8_mf_user_kernel:	�-
assignvariableop_9_mf_user_bias:5
"assignvariableop_10_mf_item_kernel:	�.
 assignvariableop_11_mf_item_bias:3
!assignvariableop_12_layer2_kernel: -
assignvariableop_13_layer2_bias:3
!assignvariableop_14_layer3_kernel:-
assignvariableop_15_layer3_bias:7
%assignvariableop_16_prediction_kernel:1
#assignvariableop_17_prediction_bias:'
assignvariableop_18_adam_iter:	 )
assignvariableop_19_adam_beta_1: )
assignvariableop_20_adam_beta_2: (
assignvariableop_21_adam_decay: 0
&assignvariableop_22_adam_learning_rate: #
assignvariableop_23_total: #
assignvariableop_24_count: %
assignvariableop_25_total_1: %
assignvariableop_26_count_1: 0
"assignvariableop_27_true_positives:1
#assignvariableop_28_false_negatives:2
$assignvariableop_29_true_positives_1:1
#assignvariableop_30_false_positives:=
*assignvariableop_31_adam_mlp_user_kernel_m:	� 6
(assignvariableop_32_adam_mlp_user_bias_m: =
*assignvariableop_33_adam_mlp_item_kernel_m:	� 6
(assignvariableop_34_adam_mlp_item_bias_m: :
(assignvariableop_35_adam_layer0_kernel_m:@@4
&assignvariableop_36_adam_layer0_bias_m:@:
(assignvariableop_37_adam_layer1_kernel_m:@ 4
&assignvariableop_38_adam_layer1_bias_m: <
)assignvariableop_39_adam_mf_user_kernel_m:	�5
'assignvariableop_40_adam_mf_user_bias_m:<
)assignvariableop_41_adam_mf_item_kernel_m:	�5
'assignvariableop_42_adam_mf_item_bias_m::
(assignvariableop_43_adam_layer2_kernel_m: 4
&assignvariableop_44_adam_layer2_bias_m::
(assignvariableop_45_adam_layer3_kernel_m:4
&assignvariableop_46_adam_layer3_bias_m:>
,assignvariableop_47_adam_prediction_kernel_m:8
*assignvariableop_48_adam_prediction_bias_m:=
*assignvariableop_49_adam_mlp_user_kernel_v:	� 6
(assignvariableop_50_adam_mlp_user_bias_v: =
*assignvariableop_51_adam_mlp_item_kernel_v:	� 6
(assignvariableop_52_adam_mlp_item_bias_v: :
(assignvariableop_53_adam_layer0_kernel_v:@@4
&assignvariableop_54_adam_layer0_bias_v:@:
(assignvariableop_55_adam_layer1_kernel_v:@ 4
&assignvariableop_56_adam_layer1_bias_v: <
)assignvariableop_57_adam_mf_user_kernel_v:	�5
'assignvariableop_58_adam_mf_user_bias_v:<
)assignvariableop_59_adam_mf_item_kernel_v:	�5
'assignvariableop_60_adam_mf_item_bias_v::
(assignvariableop_61_adam_layer2_kernel_v: 4
&assignvariableop_62_adam_layer2_bias_v::
(assignvariableop_63_adam_layer3_kernel_v:4
&assignvariableop_64_adam_layer3_bias_v:>
,assignvariableop_65_adam_prediction_kernel_v:8
*assignvariableop_66_adam_prediction_bias_v:
identity_68��AssignVariableOp�AssignVariableOp_1�AssignVariableOp_10�AssignVariableOp_11�AssignVariableOp_12�AssignVariableOp_13�AssignVariableOp_14�AssignVariableOp_15�AssignVariableOp_16�AssignVariableOp_17�AssignVariableOp_18�AssignVariableOp_19�AssignVariableOp_2�AssignVariableOp_20�AssignVariableOp_21�AssignVariableOp_22�AssignVariableOp_23�AssignVariableOp_24�AssignVariableOp_25�AssignVariableOp_26�AssignVariableOp_27�AssignVariableOp_28�AssignVariableOp_29�AssignVariableOp_3�AssignVariableOp_30�AssignVariableOp_31�AssignVariableOp_32�AssignVariableOp_33�AssignVariableOp_34�AssignVariableOp_35�AssignVariableOp_36�AssignVariableOp_37�AssignVariableOp_38�AssignVariableOp_39�AssignVariableOp_4�AssignVariableOp_40�AssignVariableOp_41�AssignVariableOp_42�AssignVariableOp_43�AssignVariableOp_44�AssignVariableOp_45�AssignVariableOp_46�AssignVariableOp_47�AssignVariableOp_48�AssignVariableOp_49�AssignVariableOp_5�AssignVariableOp_50�AssignVariableOp_51�AssignVariableOp_52�AssignVariableOp_53�AssignVariableOp_54�AssignVariableOp_55�AssignVariableOp_56�AssignVariableOp_57�AssignVariableOp_58�AssignVariableOp_59�AssignVariableOp_6�AssignVariableOp_60�AssignVariableOp_61�AssignVariableOp_62�AssignVariableOp_63�AssignVariableOp_64�AssignVariableOp_65�AssignVariableOp_66�AssignVariableOp_7�AssignVariableOp_8�AssignVariableOp_9�%
RestoreV2/tensor_namesConst"/device:CPU:0*
_output_shapes
:D*
dtype0*�$
value�$B�$DB6layer_with_weights-0/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-0/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-1/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-1/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-2/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-2/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-3/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-3/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-4/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-4/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-5/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-5/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-6/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-6/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-7/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-7/bias/.ATTRIBUTES/VARIABLE_VALUEB6layer_with_weights-8/kernel/.ATTRIBUTES/VARIABLE_VALUEB4layer_with_weights-8/bias/.ATTRIBUTES/VARIABLE_VALUEB)optimizer/iter/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_1/.ATTRIBUTES/VARIABLE_VALUEB+optimizer/beta_2/.ATTRIBUTES/VARIABLE_VALUEB*optimizer/decay/.ATTRIBUTES/VARIABLE_VALUEB2optimizer/learning_rate/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/0/count/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/total/.ATTRIBUTES/VARIABLE_VALUEB4keras_api/metrics/1/count/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/2/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/2/false_negatives/.ATTRIBUTES/VARIABLE_VALUEB=keras_api/metrics/3/true_positives/.ATTRIBUTES/VARIABLE_VALUEB>keras_api/metrics/3/false_positives/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-8/bias/.OPTIMIZER_SLOT/optimizer/m/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-0/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-0/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-1/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-1/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-2/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-2/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-3/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-3/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-4/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-4/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-5/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-5/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-6/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-6/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-7/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-7/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBRlayer_with_weights-8/kernel/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEBPlayer_with_weights-8/bias/.OPTIMIZER_SLOT/optimizer/v/.ATTRIBUTES/VARIABLE_VALUEB_CHECKPOINTABLE_OBJECT_GRAPH2
RestoreV2/tensor_names�
RestoreV2/shape_and_slicesConst"/device:CPU:0*
_output_shapes
:D*
dtype0*�
value�B�DB B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 2
RestoreV2/shape_and_slices�
	RestoreV2	RestoreV2file_prefixRestoreV2/tensor_names:output:0#RestoreV2/shape_and_slices:output:0"/device:CPU:0*�
_output_shapes�
�::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::*R
dtypesH
F2D	2
	RestoreV2g
IdentityIdentityRestoreV2:tensors:0"/device:CPU:0*
T0*
_output_shapes
:2

Identity�
AssignVariableOpAssignVariableOp assignvariableop_mlp_user_kernelIdentity:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOpk

Identity_1IdentityRestoreV2:tensors:1"/device:CPU:0*
T0*
_output_shapes
:2

Identity_1�
AssignVariableOp_1AssignVariableOp assignvariableop_1_mlp_user_biasIdentity_1:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_1k

Identity_2IdentityRestoreV2:tensors:2"/device:CPU:0*
T0*
_output_shapes
:2

Identity_2�
AssignVariableOp_2AssignVariableOp"assignvariableop_2_mlp_item_kernelIdentity_2:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_2k

Identity_3IdentityRestoreV2:tensors:3"/device:CPU:0*
T0*
_output_shapes
:2

Identity_3�
AssignVariableOp_3AssignVariableOp assignvariableop_3_mlp_item_biasIdentity_3:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_3k

Identity_4IdentityRestoreV2:tensors:4"/device:CPU:0*
T0*
_output_shapes
:2

Identity_4�
AssignVariableOp_4AssignVariableOp assignvariableop_4_layer0_kernelIdentity_4:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_4k

Identity_5IdentityRestoreV2:tensors:5"/device:CPU:0*
T0*
_output_shapes
:2

Identity_5�
AssignVariableOp_5AssignVariableOpassignvariableop_5_layer0_biasIdentity_5:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_5k

Identity_6IdentityRestoreV2:tensors:6"/device:CPU:0*
T0*
_output_shapes
:2

Identity_6�
AssignVariableOp_6AssignVariableOp assignvariableop_6_layer1_kernelIdentity_6:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_6k

Identity_7IdentityRestoreV2:tensors:7"/device:CPU:0*
T0*
_output_shapes
:2

Identity_7�
AssignVariableOp_7AssignVariableOpassignvariableop_7_layer1_biasIdentity_7:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_7k

Identity_8IdentityRestoreV2:tensors:8"/device:CPU:0*
T0*
_output_shapes
:2

Identity_8�
AssignVariableOp_8AssignVariableOp!assignvariableop_8_mf_user_kernelIdentity_8:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_8k

Identity_9IdentityRestoreV2:tensors:9"/device:CPU:0*
T0*
_output_shapes
:2

Identity_9�
AssignVariableOp_9AssignVariableOpassignvariableop_9_mf_user_biasIdentity_9:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_9n
Identity_10IdentityRestoreV2:tensors:10"/device:CPU:0*
T0*
_output_shapes
:2
Identity_10�
AssignVariableOp_10AssignVariableOp"assignvariableop_10_mf_item_kernelIdentity_10:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_10n
Identity_11IdentityRestoreV2:tensors:11"/device:CPU:0*
T0*
_output_shapes
:2
Identity_11�
AssignVariableOp_11AssignVariableOp assignvariableop_11_mf_item_biasIdentity_11:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_11n
Identity_12IdentityRestoreV2:tensors:12"/device:CPU:0*
T0*
_output_shapes
:2
Identity_12�
AssignVariableOp_12AssignVariableOp!assignvariableop_12_layer2_kernelIdentity_12:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_12n
Identity_13IdentityRestoreV2:tensors:13"/device:CPU:0*
T0*
_output_shapes
:2
Identity_13�
AssignVariableOp_13AssignVariableOpassignvariableop_13_layer2_biasIdentity_13:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_13n
Identity_14IdentityRestoreV2:tensors:14"/device:CPU:0*
T0*
_output_shapes
:2
Identity_14�
AssignVariableOp_14AssignVariableOp!assignvariableop_14_layer3_kernelIdentity_14:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_14n
Identity_15IdentityRestoreV2:tensors:15"/device:CPU:0*
T0*
_output_shapes
:2
Identity_15�
AssignVariableOp_15AssignVariableOpassignvariableop_15_layer3_biasIdentity_15:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_15n
Identity_16IdentityRestoreV2:tensors:16"/device:CPU:0*
T0*
_output_shapes
:2
Identity_16�
AssignVariableOp_16AssignVariableOp%assignvariableop_16_prediction_kernelIdentity_16:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_16n
Identity_17IdentityRestoreV2:tensors:17"/device:CPU:0*
T0*
_output_shapes
:2
Identity_17�
AssignVariableOp_17AssignVariableOp#assignvariableop_17_prediction_biasIdentity_17:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_17n
Identity_18IdentityRestoreV2:tensors:18"/device:CPU:0*
T0	*
_output_shapes
:2
Identity_18�
AssignVariableOp_18AssignVariableOpassignvariableop_18_adam_iterIdentity_18:output:0"/device:CPU:0*
_output_shapes
 *
dtype0	2
AssignVariableOp_18n
Identity_19IdentityRestoreV2:tensors:19"/device:CPU:0*
T0*
_output_shapes
:2
Identity_19�
AssignVariableOp_19AssignVariableOpassignvariableop_19_adam_beta_1Identity_19:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_19n
Identity_20IdentityRestoreV2:tensors:20"/device:CPU:0*
T0*
_output_shapes
:2
Identity_20�
AssignVariableOp_20AssignVariableOpassignvariableop_20_adam_beta_2Identity_20:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_20n
Identity_21IdentityRestoreV2:tensors:21"/device:CPU:0*
T0*
_output_shapes
:2
Identity_21�
AssignVariableOp_21AssignVariableOpassignvariableop_21_adam_decayIdentity_21:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_21n
Identity_22IdentityRestoreV2:tensors:22"/device:CPU:0*
T0*
_output_shapes
:2
Identity_22�
AssignVariableOp_22AssignVariableOp&assignvariableop_22_adam_learning_rateIdentity_22:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_22n
Identity_23IdentityRestoreV2:tensors:23"/device:CPU:0*
T0*
_output_shapes
:2
Identity_23�
AssignVariableOp_23AssignVariableOpassignvariableop_23_totalIdentity_23:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_23n
Identity_24IdentityRestoreV2:tensors:24"/device:CPU:0*
T0*
_output_shapes
:2
Identity_24�
AssignVariableOp_24AssignVariableOpassignvariableop_24_countIdentity_24:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_24n
Identity_25IdentityRestoreV2:tensors:25"/device:CPU:0*
T0*
_output_shapes
:2
Identity_25�
AssignVariableOp_25AssignVariableOpassignvariableop_25_total_1Identity_25:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_25n
Identity_26IdentityRestoreV2:tensors:26"/device:CPU:0*
T0*
_output_shapes
:2
Identity_26�
AssignVariableOp_26AssignVariableOpassignvariableop_26_count_1Identity_26:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_26n
Identity_27IdentityRestoreV2:tensors:27"/device:CPU:0*
T0*
_output_shapes
:2
Identity_27�
AssignVariableOp_27AssignVariableOp"assignvariableop_27_true_positivesIdentity_27:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_27n
Identity_28IdentityRestoreV2:tensors:28"/device:CPU:0*
T0*
_output_shapes
:2
Identity_28�
AssignVariableOp_28AssignVariableOp#assignvariableop_28_false_negativesIdentity_28:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_28n
Identity_29IdentityRestoreV2:tensors:29"/device:CPU:0*
T0*
_output_shapes
:2
Identity_29�
AssignVariableOp_29AssignVariableOp$assignvariableop_29_true_positives_1Identity_29:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_29n
Identity_30IdentityRestoreV2:tensors:30"/device:CPU:0*
T0*
_output_shapes
:2
Identity_30�
AssignVariableOp_30AssignVariableOp#assignvariableop_30_false_positivesIdentity_30:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_30n
Identity_31IdentityRestoreV2:tensors:31"/device:CPU:0*
T0*
_output_shapes
:2
Identity_31�
AssignVariableOp_31AssignVariableOp*assignvariableop_31_adam_mlp_user_kernel_mIdentity_31:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_31n
Identity_32IdentityRestoreV2:tensors:32"/device:CPU:0*
T0*
_output_shapes
:2
Identity_32�
AssignVariableOp_32AssignVariableOp(assignvariableop_32_adam_mlp_user_bias_mIdentity_32:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_32n
Identity_33IdentityRestoreV2:tensors:33"/device:CPU:0*
T0*
_output_shapes
:2
Identity_33�
AssignVariableOp_33AssignVariableOp*assignvariableop_33_adam_mlp_item_kernel_mIdentity_33:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_33n
Identity_34IdentityRestoreV2:tensors:34"/device:CPU:0*
T0*
_output_shapes
:2
Identity_34�
AssignVariableOp_34AssignVariableOp(assignvariableop_34_adam_mlp_item_bias_mIdentity_34:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_34n
Identity_35IdentityRestoreV2:tensors:35"/device:CPU:0*
T0*
_output_shapes
:2
Identity_35�
AssignVariableOp_35AssignVariableOp(assignvariableop_35_adam_layer0_kernel_mIdentity_35:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_35n
Identity_36IdentityRestoreV2:tensors:36"/device:CPU:0*
T0*
_output_shapes
:2
Identity_36�
AssignVariableOp_36AssignVariableOp&assignvariableop_36_adam_layer0_bias_mIdentity_36:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_36n
Identity_37IdentityRestoreV2:tensors:37"/device:CPU:0*
T0*
_output_shapes
:2
Identity_37�
AssignVariableOp_37AssignVariableOp(assignvariableop_37_adam_layer1_kernel_mIdentity_37:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_37n
Identity_38IdentityRestoreV2:tensors:38"/device:CPU:0*
T0*
_output_shapes
:2
Identity_38�
AssignVariableOp_38AssignVariableOp&assignvariableop_38_adam_layer1_bias_mIdentity_38:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_38n
Identity_39IdentityRestoreV2:tensors:39"/device:CPU:0*
T0*
_output_shapes
:2
Identity_39�
AssignVariableOp_39AssignVariableOp)assignvariableop_39_adam_mf_user_kernel_mIdentity_39:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_39n
Identity_40IdentityRestoreV2:tensors:40"/device:CPU:0*
T0*
_output_shapes
:2
Identity_40�
AssignVariableOp_40AssignVariableOp'assignvariableop_40_adam_mf_user_bias_mIdentity_40:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_40n
Identity_41IdentityRestoreV2:tensors:41"/device:CPU:0*
T0*
_output_shapes
:2
Identity_41�
AssignVariableOp_41AssignVariableOp)assignvariableop_41_adam_mf_item_kernel_mIdentity_41:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_41n
Identity_42IdentityRestoreV2:tensors:42"/device:CPU:0*
T0*
_output_shapes
:2
Identity_42�
AssignVariableOp_42AssignVariableOp'assignvariableop_42_adam_mf_item_bias_mIdentity_42:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_42n
Identity_43IdentityRestoreV2:tensors:43"/device:CPU:0*
T0*
_output_shapes
:2
Identity_43�
AssignVariableOp_43AssignVariableOp(assignvariableop_43_adam_layer2_kernel_mIdentity_43:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_43n
Identity_44IdentityRestoreV2:tensors:44"/device:CPU:0*
T0*
_output_shapes
:2
Identity_44�
AssignVariableOp_44AssignVariableOp&assignvariableop_44_adam_layer2_bias_mIdentity_44:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_44n
Identity_45IdentityRestoreV2:tensors:45"/device:CPU:0*
T0*
_output_shapes
:2
Identity_45�
AssignVariableOp_45AssignVariableOp(assignvariableop_45_adam_layer3_kernel_mIdentity_45:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_45n
Identity_46IdentityRestoreV2:tensors:46"/device:CPU:0*
T0*
_output_shapes
:2
Identity_46�
AssignVariableOp_46AssignVariableOp&assignvariableop_46_adam_layer3_bias_mIdentity_46:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_46n
Identity_47IdentityRestoreV2:tensors:47"/device:CPU:0*
T0*
_output_shapes
:2
Identity_47�
AssignVariableOp_47AssignVariableOp,assignvariableop_47_adam_prediction_kernel_mIdentity_47:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_47n
Identity_48IdentityRestoreV2:tensors:48"/device:CPU:0*
T0*
_output_shapes
:2
Identity_48�
AssignVariableOp_48AssignVariableOp*assignvariableop_48_adam_prediction_bias_mIdentity_48:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_48n
Identity_49IdentityRestoreV2:tensors:49"/device:CPU:0*
T0*
_output_shapes
:2
Identity_49�
AssignVariableOp_49AssignVariableOp*assignvariableop_49_adam_mlp_user_kernel_vIdentity_49:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_49n
Identity_50IdentityRestoreV2:tensors:50"/device:CPU:0*
T0*
_output_shapes
:2
Identity_50�
AssignVariableOp_50AssignVariableOp(assignvariableop_50_adam_mlp_user_bias_vIdentity_50:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_50n
Identity_51IdentityRestoreV2:tensors:51"/device:CPU:0*
T0*
_output_shapes
:2
Identity_51�
AssignVariableOp_51AssignVariableOp*assignvariableop_51_adam_mlp_item_kernel_vIdentity_51:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_51n
Identity_52IdentityRestoreV2:tensors:52"/device:CPU:0*
T0*
_output_shapes
:2
Identity_52�
AssignVariableOp_52AssignVariableOp(assignvariableop_52_adam_mlp_item_bias_vIdentity_52:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_52n
Identity_53IdentityRestoreV2:tensors:53"/device:CPU:0*
T0*
_output_shapes
:2
Identity_53�
AssignVariableOp_53AssignVariableOp(assignvariableop_53_adam_layer0_kernel_vIdentity_53:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_53n
Identity_54IdentityRestoreV2:tensors:54"/device:CPU:0*
T0*
_output_shapes
:2
Identity_54�
AssignVariableOp_54AssignVariableOp&assignvariableop_54_adam_layer0_bias_vIdentity_54:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_54n
Identity_55IdentityRestoreV2:tensors:55"/device:CPU:0*
T0*
_output_shapes
:2
Identity_55�
AssignVariableOp_55AssignVariableOp(assignvariableop_55_adam_layer1_kernel_vIdentity_55:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_55n
Identity_56IdentityRestoreV2:tensors:56"/device:CPU:0*
T0*
_output_shapes
:2
Identity_56�
AssignVariableOp_56AssignVariableOp&assignvariableop_56_adam_layer1_bias_vIdentity_56:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_56n
Identity_57IdentityRestoreV2:tensors:57"/device:CPU:0*
T0*
_output_shapes
:2
Identity_57�
AssignVariableOp_57AssignVariableOp)assignvariableop_57_adam_mf_user_kernel_vIdentity_57:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_57n
Identity_58IdentityRestoreV2:tensors:58"/device:CPU:0*
T0*
_output_shapes
:2
Identity_58�
AssignVariableOp_58AssignVariableOp'assignvariableop_58_adam_mf_user_bias_vIdentity_58:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_58n
Identity_59IdentityRestoreV2:tensors:59"/device:CPU:0*
T0*
_output_shapes
:2
Identity_59�
AssignVariableOp_59AssignVariableOp)assignvariableop_59_adam_mf_item_kernel_vIdentity_59:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_59n
Identity_60IdentityRestoreV2:tensors:60"/device:CPU:0*
T0*
_output_shapes
:2
Identity_60�
AssignVariableOp_60AssignVariableOp'assignvariableop_60_adam_mf_item_bias_vIdentity_60:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_60n
Identity_61IdentityRestoreV2:tensors:61"/device:CPU:0*
T0*
_output_shapes
:2
Identity_61�
AssignVariableOp_61AssignVariableOp(assignvariableop_61_adam_layer2_kernel_vIdentity_61:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_61n
Identity_62IdentityRestoreV2:tensors:62"/device:CPU:0*
T0*
_output_shapes
:2
Identity_62�
AssignVariableOp_62AssignVariableOp&assignvariableop_62_adam_layer2_bias_vIdentity_62:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_62n
Identity_63IdentityRestoreV2:tensors:63"/device:CPU:0*
T0*
_output_shapes
:2
Identity_63�
AssignVariableOp_63AssignVariableOp(assignvariableop_63_adam_layer3_kernel_vIdentity_63:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_63n
Identity_64IdentityRestoreV2:tensors:64"/device:CPU:0*
T0*
_output_shapes
:2
Identity_64�
AssignVariableOp_64AssignVariableOp&assignvariableop_64_adam_layer3_bias_vIdentity_64:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_64n
Identity_65IdentityRestoreV2:tensors:65"/device:CPU:0*
T0*
_output_shapes
:2
Identity_65�
AssignVariableOp_65AssignVariableOp,assignvariableop_65_adam_prediction_kernel_vIdentity_65:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_65n
Identity_66IdentityRestoreV2:tensors:66"/device:CPU:0*
T0*
_output_shapes
:2
Identity_66�
AssignVariableOp_66AssignVariableOp*assignvariableop_66_adam_prediction_bias_vIdentity_66:output:0"/device:CPU:0*
_output_shapes
 *
dtype02
AssignVariableOp_669
NoOpNoOp"/device:CPU:0*
_output_shapes
 2
NoOp�
Identity_67Identityfile_prefix^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9^NoOp"/device:CPU:0*
T0*
_output_shapes
: 2
Identity_67f
Identity_68IdentityIdentity_67:output:0^NoOp_1*
T0*
_output_shapes
: 2
Identity_68�
NoOp_1NoOp^AssignVariableOp^AssignVariableOp_1^AssignVariableOp_10^AssignVariableOp_11^AssignVariableOp_12^AssignVariableOp_13^AssignVariableOp_14^AssignVariableOp_15^AssignVariableOp_16^AssignVariableOp_17^AssignVariableOp_18^AssignVariableOp_19^AssignVariableOp_2^AssignVariableOp_20^AssignVariableOp_21^AssignVariableOp_22^AssignVariableOp_23^AssignVariableOp_24^AssignVariableOp_25^AssignVariableOp_26^AssignVariableOp_27^AssignVariableOp_28^AssignVariableOp_29^AssignVariableOp_3^AssignVariableOp_30^AssignVariableOp_31^AssignVariableOp_32^AssignVariableOp_33^AssignVariableOp_34^AssignVariableOp_35^AssignVariableOp_36^AssignVariableOp_37^AssignVariableOp_38^AssignVariableOp_39^AssignVariableOp_4^AssignVariableOp_40^AssignVariableOp_41^AssignVariableOp_42^AssignVariableOp_43^AssignVariableOp_44^AssignVariableOp_45^AssignVariableOp_46^AssignVariableOp_47^AssignVariableOp_48^AssignVariableOp_49^AssignVariableOp_5^AssignVariableOp_50^AssignVariableOp_51^AssignVariableOp_52^AssignVariableOp_53^AssignVariableOp_54^AssignVariableOp_55^AssignVariableOp_56^AssignVariableOp_57^AssignVariableOp_58^AssignVariableOp_59^AssignVariableOp_6^AssignVariableOp_60^AssignVariableOp_61^AssignVariableOp_62^AssignVariableOp_63^AssignVariableOp_64^AssignVariableOp_65^AssignVariableOp_66^AssignVariableOp_7^AssignVariableOp_8^AssignVariableOp_9*"
_acd_function_control_output(*
_output_shapes
 2
NoOp_1"#
identity_68Identity_68:output:0*�
_input_shapes�
�: : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : : 2$
AssignVariableOpAssignVariableOp2(
AssignVariableOp_1AssignVariableOp_12*
AssignVariableOp_10AssignVariableOp_102*
AssignVariableOp_11AssignVariableOp_112*
AssignVariableOp_12AssignVariableOp_122*
AssignVariableOp_13AssignVariableOp_132*
AssignVariableOp_14AssignVariableOp_142*
AssignVariableOp_15AssignVariableOp_152*
AssignVariableOp_16AssignVariableOp_162*
AssignVariableOp_17AssignVariableOp_172*
AssignVariableOp_18AssignVariableOp_182*
AssignVariableOp_19AssignVariableOp_192(
AssignVariableOp_2AssignVariableOp_22*
AssignVariableOp_20AssignVariableOp_202*
AssignVariableOp_21AssignVariableOp_212*
AssignVariableOp_22AssignVariableOp_222*
AssignVariableOp_23AssignVariableOp_232*
AssignVariableOp_24AssignVariableOp_242*
AssignVariableOp_25AssignVariableOp_252*
AssignVariableOp_26AssignVariableOp_262*
AssignVariableOp_27AssignVariableOp_272*
AssignVariableOp_28AssignVariableOp_282*
AssignVariableOp_29AssignVariableOp_292(
AssignVariableOp_3AssignVariableOp_32*
AssignVariableOp_30AssignVariableOp_302*
AssignVariableOp_31AssignVariableOp_312*
AssignVariableOp_32AssignVariableOp_322*
AssignVariableOp_33AssignVariableOp_332*
AssignVariableOp_34AssignVariableOp_342*
AssignVariableOp_35AssignVariableOp_352*
AssignVariableOp_36AssignVariableOp_362*
AssignVariableOp_37AssignVariableOp_372*
AssignVariableOp_38AssignVariableOp_382*
AssignVariableOp_39AssignVariableOp_392(
AssignVariableOp_4AssignVariableOp_42*
AssignVariableOp_40AssignVariableOp_402*
AssignVariableOp_41AssignVariableOp_412*
AssignVariableOp_42AssignVariableOp_422*
AssignVariableOp_43AssignVariableOp_432*
AssignVariableOp_44AssignVariableOp_442*
AssignVariableOp_45AssignVariableOp_452*
AssignVariableOp_46AssignVariableOp_462*
AssignVariableOp_47AssignVariableOp_472*
AssignVariableOp_48AssignVariableOp_482*
AssignVariableOp_49AssignVariableOp_492(
AssignVariableOp_5AssignVariableOp_52*
AssignVariableOp_50AssignVariableOp_502*
AssignVariableOp_51AssignVariableOp_512*
AssignVariableOp_52AssignVariableOp_522*
AssignVariableOp_53AssignVariableOp_532*
AssignVariableOp_54AssignVariableOp_542*
AssignVariableOp_55AssignVariableOp_552*
AssignVariableOp_56AssignVariableOp_562*
AssignVariableOp_57AssignVariableOp_572*
AssignVariableOp_58AssignVariableOp_582*
AssignVariableOp_59AssignVariableOp_592(
AssignVariableOp_6AssignVariableOp_62*
AssignVariableOp_60AssignVariableOp_602*
AssignVariableOp_61AssignVariableOp_612*
AssignVariableOp_62AssignVariableOp_622*
AssignVariableOp_63AssignVariableOp_632*
AssignVariableOp_64AssignVariableOp_642*
AssignVariableOp_65AssignVariableOp_652*
AssignVariableOp_66AssignVariableOp_662(
AssignVariableOp_7AssignVariableOp_72(
AssignVariableOp_8AssignVariableOp_82(
AssignVariableOp_9AssignVariableOp_9:C ?

_output_shapes
: 
%
_user_specified_namefile_prefix
�
�
A__inference_model_layer_call_and_return_conditional_losses_211654
inputs_0
inputs_1:
'mlp_user_matmul_readvariableop_resource:	� 6
(mlp_user_biasadd_readvariableop_resource: :
'mlp_item_matmul_readvariableop_resource:	� 6
(mlp_item_biasadd_readvariableop_resource: 7
%layer0_matmul_readvariableop_resource:@@4
&layer0_biasadd_readvariableop_resource:@7
%layer1_matmul_readvariableop_resource:@ 4
&layer1_biasadd_readvariableop_resource: 7
%layer2_matmul_readvariableop_resource: 4
&layer2_biasadd_readvariableop_resource:9
&mf_user_matmul_readvariableop_resource:	�5
'mf_user_biasadd_readvariableop_resource:9
&mf_item_matmul_readvariableop_resource:	�5
'mf_item_biasadd_readvariableop_resource:7
%layer3_matmul_readvariableop_resource:4
&layer3_biasadd_readvariableop_resource:;
)prediction_matmul_readvariableop_resource:8
*prediction_biasadd_readvariableop_resource:
identity��layer0/BiasAdd/ReadVariableOp�layer0/MatMul/ReadVariableOp�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�layer1/BiasAdd/ReadVariableOp�layer1/MatMul/ReadVariableOp�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�layer2/BiasAdd/ReadVariableOp�layer2/MatMul/ReadVariableOp�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�layer3/BiasAdd/ReadVariableOp�layer3/MatMul/ReadVariableOp�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�mf_item/BiasAdd/ReadVariableOp�mf_item/MatMul/ReadVariableOp�mf_user/BiasAdd/ReadVariableOp�mf_user/MatMul/ReadVariableOp�mlp_item/BiasAdd/ReadVariableOp�mlp_item/MatMul/ReadVariableOp�mlp_user/BiasAdd/ReadVariableOp�mlp_user/MatMul/ReadVariableOp�!prediction/BiasAdd/ReadVariableOp� prediction/MatMul/ReadVariableOpm
dropout/IdentityIdentityinputs_0*
T0*(
_output_shapes
:����������2
dropout/Identity�
mlp_user/MatMul/ReadVariableOpReadVariableOp'mlp_user_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype02 
mlp_user/MatMul/ReadVariableOp�
mlp_user/MatMulMatMuldropout/Identity:output:0&mlp_user/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_user/MatMul�
mlp_user/BiasAdd/ReadVariableOpReadVariableOp(mlp_user_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
mlp_user/BiasAdd/ReadVariableOp�
mlp_user/BiasAddBiasAddmlp_user/MatMul:product:0'mlp_user/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_user/BiasAdds
mlp_user/ReluRelumlp_user/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
mlp_user/Relu�
mlp_item/MatMul/ReadVariableOpReadVariableOp'mlp_item_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype02 
mlp_item/MatMul/ReadVariableOp�
mlp_item/MatMulMatMulinputs_1&mlp_item/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_item/MatMul�
mlp_item/BiasAdd/ReadVariableOpReadVariableOp(mlp_item_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
mlp_item/BiasAdd/ReadVariableOp�
mlp_item/BiasAddBiasAddmlp_item/MatMul:product:0'mlp_item/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_item/BiasAdds
mlp_item/ReluRelumlp_item/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
mlp_item/Relut
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axis�
concatenate/concatConcatV2mlp_user/Relu:activations:0mlp_item/Relu:activations:0 concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������@2
concatenate/concat�
layer0/MatMul/ReadVariableOpReadVariableOp%layer0_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
layer0/MatMul/ReadVariableOp�
layer0/MatMulMatMulconcatenate/concat:output:0$layer0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
layer0/MatMul�
layer0/BiasAdd/ReadVariableOpReadVariableOp&layer0_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
layer0/BiasAdd/ReadVariableOp�
layer0/BiasAddBiasAddlayer0/MatMul:product:0%layer0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
layer0/BiasAddm
layer0/ReluRelulayer0/BiasAdd:output:0*
T0*'
_output_shapes
:���������@2
layer0/Relu�
layer1/MatMul/ReadVariableOpReadVariableOp%layer1_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype02
layer1/MatMul/ReadVariableOp�
layer1/MatMulMatMullayer0/Relu:activations:0$layer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
layer1/MatMul�
layer1/BiasAdd/ReadVariableOpReadVariableOp&layer1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02
layer1/BiasAdd/ReadVariableOp�
layer1/BiasAddBiasAddlayer1/MatMul:product:0%layer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
layer1/BiasAddm
layer1/ReluRelulayer1/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
layer1/Relu�
layer2/MatMul/ReadVariableOpReadVariableOp%layer2_matmul_readvariableop_resource*
_output_shapes

: *
dtype02
layer2/MatMul/ReadVariableOp�
layer2/MatMulMatMullayer1/Relu:activations:0$layer2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer2/MatMul�
layer2/BiasAdd/ReadVariableOpReadVariableOp&layer2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer2/BiasAdd/ReadVariableOp�
layer2/BiasAddBiasAddlayer2/MatMul:product:0%layer2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer2/BiasAddm
layer2/ReluRelulayer2/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
layer2/Relu�
mf_user/MatMul/ReadVariableOpReadVariableOp&mf_user_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
mf_user/MatMul/ReadVariableOp�
mf_user/MatMulMatMuldropout/Identity:output:0%mf_user/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_user/MatMul�
mf_user/BiasAdd/ReadVariableOpReadVariableOp'mf_user_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
mf_user/BiasAdd/ReadVariableOp�
mf_user/BiasAddBiasAddmf_user/MatMul:product:0&mf_user/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_user/BiasAddp
mf_user/ReluRelumf_user/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
mf_user/Relu�
mf_item/MatMul/ReadVariableOpReadVariableOp&mf_item_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
mf_item/MatMul/ReadVariableOp�
mf_item/MatMulMatMulinputs_1%mf_item/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_item/MatMul�
mf_item/BiasAdd/ReadVariableOpReadVariableOp'mf_item_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
mf_item/BiasAdd/ReadVariableOp�
mf_item/BiasAddBiasAddmf_item/MatMul:product:0&mf_item/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_item/BiasAddp
mf_item/ReluRelumf_item/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
mf_item/Relu�
multiply/mulMulmf_user/Relu:activations:0mf_item/Relu:activations:0*
T0*'
_output_shapes
:���������2
multiply/mul�
layer3/MatMul/ReadVariableOpReadVariableOp%layer3_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
layer3/MatMul/ReadVariableOp�
layer3/MatMulMatMullayer2/Relu:activations:0$layer3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer3/MatMul�
layer3/BiasAdd/ReadVariableOpReadVariableOp&layer3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer3/BiasAdd/ReadVariableOp�
layer3/BiasAddBiasAddlayer3/MatMul:product:0%layer3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer3/BiasAddm
layer3/ReluRelulayer3/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
layer3/Relux
concatenate_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate_1/concat/axis�
concatenate_1/concatConcatV2multiply/mul:z:0layer3/Relu:activations:0"concatenate_1/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������2
concatenate_1/concat�
 prediction/MatMul/ReadVariableOpReadVariableOp)prediction_matmul_readvariableop_resource*
_output_shapes

:*
dtype02"
 prediction/MatMul/ReadVariableOp�
prediction/MatMulMatMulconcatenate_1/concat:output:0(prediction/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
prediction/MatMul�
!prediction/BiasAdd/ReadVariableOpReadVariableOp*prediction_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02#
!prediction/BiasAdd/ReadVariableOp�
prediction/BiasAddBiasAddprediction/MatMul:product:0)prediction/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
prediction/BiasAdd�
prediction/SigmoidSigmoidprediction/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
prediction/Sigmoid�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer0_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer0_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mul�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer1_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mul�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer2_matmul_readvariableop_resource*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mul�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer3_matmul_readvariableop_resource*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mulq
IdentityIdentityprediction/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^layer0/BiasAdd/ReadVariableOp^layer0/MatMul/ReadVariableOp.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp^layer1/BiasAdd/ReadVariableOp^layer1/MatMul/ReadVariableOp.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp^layer2/BiasAdd/ReadVariableOp^layer2/MatMul/ReadVariableOp.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp^layer3/BiasAdd/ReadVariableOp^layer3/MatMul/ReadVariableOp.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp^mf_item/BiasAdd/ReadVariableOp^mf_item/MatMul/ReadVariableOp^mf_user/BiasAdd/ReadVariableOp^mf_user/MatMul/ReadVariableOp ^mlp_item/BiasAdd/ReadVariableOp^mlp_item/MatMul/ReadVariableOp ^mlp_user/BiasAdd/ReadVariableOp^mlp_user/MatMul/ReadVariableOp"^prediction/BiasAdd/ReadVariableOp!^prediction/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 2>
layer0/BiasAdd/ReadVariableOplayer0/BiasAdd/ReadVariableOp2<
layer0/MatMul/ReadVariableOplayer0/MatMul/ReadVariableOp2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp2>
layer1/BiasAdd/ReadVariableOplayer1/BiasAdd/ReadVariableOp2<
layer1/MatMul/ReadVariableOplayer1/MatMul/ReadVariableOp2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp2>
layer2/BiasAdd/ReadVariableOplayer2/BiasAdd/ReadVariableOp2<
layer2/MatMul/ReadVariableOplayer2/MatMul/ReadVariableOp2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp2>
layer3/BiasAdd/ReadVariableOplayer3/BiasAdd/ReadVariableOp2<
layer3/MatMul/ReadVariableOplayer3/MatMul/ReadVariableOp2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp2@
mf_item/BiasAdd/ReadVariableOpmf_item/BiasAdd/ReadVariableOp2>
mf_item/MatMul/ReadVariableOpmf_item/MatMul/ReadVariableOp2@
mf_user/BiasAdd/ReadVariableOpmf_user/BiasAdd/ReadVariableOp2>
mf_user/MatMul/ReadVariableOpmf_user/MatMul/ReadVariableOp2B
mlp_item/BiasAdd/ReadVariableOpmlp_item/BiasAdd/ReadVariableOp2@
mlp_item/MatMul/ReadVariableOpmlp_item/MatMul/ReadVariableOp2B
mlp_user/BiasAdd/ReadVariableOpmlp_user/BiasAdd/ReadVariableOp2@
mlp_user/MatMul/ReadVariableOpmlp_user/MatMul/ReadVariableOp2F
!prediction/BiasAdd/ReadVariableOp!prediction/BiasAdd/ReadVariableOp2D
 prediction/MatMul/ReadVariableOp prediction/MatMul/ReadVariableOp:R N
(
_output_shapes
:����������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1
�
�
__inference_loss_fn_0_212135J
8layer0_kernel_regularizer_square_readvariableop_resource:@@
identity��/layer0/kernel/Regularizer/Square/ReadVariableOp�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOp8layer0_kernel_regularizer_square_readvariableop_resource*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mulk
IdentityIdentity!layer0/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity�
NoOpNoOp0^layer0/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp
�
b
C__inference_dropout_layer_call_and_return_conditional_losses_211810

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
F__inference_prediction_layer_call_and_return_conditional_losses_212124

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAdda
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������2	
Sigmoidf
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
+__inference_prediction_layer_call_fn_212113

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_prediction_layer_call_and_return_conditional_losses_2106902
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�h
�
!__inference__wrapped_model_210453
input_1
input_2@
-model_mlp_user_matmul_readvariableop_resource:	� <
.model_mlp_user_biasadd_readvariableop_resource: @
-model_mlp_item_matmul_readvariableop_resource:	� <
.model_mlp_item_biasadd_readvariableop_resource: =
+model_layer0_matmul_readvariableop_resource:@@:
,model_layer0_biasadd_readvariableop_resource:@=
+model_layer1_matmul_readvariableop_resource:@ :
,model_layer1_biasadd_readvariableop_resource: =
+model_layer2_matmul_readvariableop_resource: :
,model_layer2_biasadd_readvariableop_resource:?
,model_mf_user_matmul_readvariableop_resource:	�;
-model_mf_user_biasadd_readvariableop_resource:?
,model_mf_item_matmul_readvariableop_resource:	�;
-model_mf_item_biasadd_readvariableop_resource:=
+model_layer3_matmul_readvariableop_resource::
,model_layer3_biasadd_readvariableop_resource:A
/model_prediction_matmul_readvariableop_resource:>
0model_prediction_biasadd_readvariableop_resource:
identity��#model/layer0/BiasAdd/ReadVariableOp�"model/layer0/MatMul/ReadVariableOp�#model/layer1/BiasAdd/ReadVariableOp�"model/layer1/MatMul/ReadVariableOp�#model/layer2/BiasAdd/ReadVariableOp�"model/layer2/MatMul/ReadVariableOp�#model/layer3/BiasAdd/ReadVariableOp�"model/layer3/MatMul/ReadVariableOp�$model/mf_item/BiasAdd/ReadVariableOp�#model/mf_item/MatMul/ReadVariableOp�$model/mf_user/BiasAdd/ReadVariableOp�#model/mf_user/MatMul/ReadVariableOp�%model/mlp_item/BiasAdd/ReadVariableOp�$model/mlp_item/MatMul/ReadVariableOp�%model/mlp_user/BiasAdd/ReadVariableOp�$model/mlp_user/MatMul/ReadVariableOp�'model/prediction/BiasAdd/ReadVariableOp�&model/prediction/MatMul/ReadVariableOpx
model/dropout/IdentityIdentityinput_1*
T0*(
_output_shapes
:����������2
model/dropout/Identity�
$model/mlp_user/MatMul/ReadVariableOpReadVariableOp-model_mlp_user_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype02&
$model/mlp_user/MatMul/ReadVariableOp�
model/mlp_user/MatMulMatMulmodel/dropout/Identity:output:0,model/mlp_user/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
model/mlp_user/MatMul�
%model/mlp_user/BiasAdd/ReadVariableOpReadVariableOp.model_mlp_user_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02'
%model/mlp_user/BiasAdd/ReadVariableOp�
model/mlp_user/BiasAddBiasAddmodel/mlp_user/MatMul:product:0-model/mlp_user/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
model/mlp_user/BiasAdd�
model/mlp_user/ReluRelumodel/mlp_user/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
model/mlp_user/Relu�
$model/mlp_item/MatMul/ReadVariableOpReadVariableOp-model_mlp_item_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype02&
$model/mlp_item/MatMul/ReadVariableOp�
model/mlp_item/MatMulMatMulinput_2,model/mlp_item/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
model/mlp_item/MatMul�
%model/mlp_item/BiasAdd/ReadVariableOpReadVariableOp.model_mlp_item_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02'
%model/mlp_item/BiasAdd/ReadVariableOp�
model/mlp_item/BiasAddBiasAddmodel/mlp_item/MatMul:product:0-model/mlp_item/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
model/mlp_item/BiasAdd�
model/mlp_item/ReluRelumodel/mlp_item/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
model/mlp_item/Relu�
model/concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
model/concatenate/concat/axis�
model/concatenate/concatConcatV2!model/mlp_user/Relu:activations:0!model/mlp_item/Relu:activations:0&model/concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������@2
model/concatenate/concat�
"model/layer0/MatMul/ReadVariableOpReadVariableOp+model_layer0_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02$
"model/layer0/MatMul/ReadVariableOp�
model/layer0/MatMulMatMul!model/concatenate/concat:output:0*model/layer0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
model/layer0/MatMul�
#model/layer0/BiasAdd/ReadVariableOpReadVariableOp,model_layer0_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02%
#model/layer0/BiasAdd/ReadVariableOp�
model/layer0/BiasAddBiasAddmodel/layer0/MatMul:product:0+model/layer0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
model/layer0/BiasAdd
model/layer0/ReluRelumodel/layer0/BiasAdd:output:0*
T0*'
_output_shapes
:���������@2
model/layer0/Relu�
"model/layer1/MatMul/ReadVariableOpReadVariableOp+model_layer1_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype02$
"model/layer1/MatMul/ReadVariableOp�
model/layer1/MatMulMatMulmodel/layer0/Relu:activations:0*model/layer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
model/layer1/MatMul�
#model/layer1/BiasAdd/ReadVariableOpReadVariableOp,model_layer1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02%
#model/layer1/BiasAdd/ReadVariableOp�
model/layer1/BiasAddBiasAddmodel/layer1/MatMul:product:0+model/layer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
model/layer1/BiasAdd
model/layer1/ReluRelumodel/layer1/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
model/layer1/Relu�
"model/layer2/MatMul/ReadVariableOpReadVariableOp+model_layer2_matmul_readvariableop_resource*
_output_shapes

: *
dtype02$
"model/layer2/MatMul/ReadVariableOp�
model/layer2/MatMulMatMulmodel/layer1/Relu:activations:0*model/layer2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/layer2/MatMul�
#model/layer2/BiasAdd/ReadVariableOpReadVariableOp,model_layer2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#model/layer2/BiasAdd/ReadVariableOp�
model/layer2/BiasAddBiasAddmodel/layer2/MatMul:product:0+model/layer2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/layer2/BiasAdd
model/layer2/ReluRelumodel/layer2/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
model/layer2/Relu�
#model/mf_user/MatMul/ReadVariableOpReadVariableOp,model_mf_user_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02%
#model/mf_user/MatMul/ReadVariableOp�
model/mf_user/MatMulMatMulmodel/dropout/Identity:output:0+model/mf_user/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/mf_user/MatMul�
$model/mf_user/BiasAdd/ReadVariableOpReadVariableOp-model_mf_user_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02&
$model/mf_user/BiasAdd/ReadVariableOp�
model/mf_user/BiasAddBiasAddmodel/mf_user/MatMul:product:0,model/mf_user/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/mf_user/BiasAdd�
model/mf_user/ReluRelumodel/mf_user/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
model/mf_user/Relu�
#model/mf_item/MatMul/ReadVariableOpReadVariableOp,model_mf_item_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02%
#model/mf_item/MatMul/ReadVariableOp�
model/mf_item/MatMulMatMulinput_2+model/mf_item/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/mf_item/MatMul�
$model/mf_item/BiasAdd/ReadVariableOpReadVariableOp-model_mf_item_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02&
$model/mf_item/BiasAdd/ReadVariableOp�
model/mf_item/BiasAddBiasAddmodel/mf_item/MatMul:product:0,model/mf_item/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/mf_item/BiasAdd�
model/mf_item/ReluRelumodel/mf_item/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
model/mf_item/Relu�
model/multiply/mulMul model/mf_user/Relu:activations:0 model/mf_item/Relu:activations:0*
T0*'
_output_shapes
:���������2
model/multiply/mul�
"model/layer3/MatMul/ReadVariableOpReadVariableOp+model_layer3_matmul_readvariableop_resource*
_output_shapes

:*
dtype02$
"model/layer3/MatMul/ReadVariableOp�
model/layer3/MatMulMatMulmodel/layer2/Relu:activations:0*model/layer3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/layer3/MatMul�
#model/layer3/BiasAdd/ReadVariableOpReadVariableOp,model_layer3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02%
#model/layer3/BiasAdd/ReadVariableOp�
model/layer3/BiasAddBiasAddmodel/layer3/MatMul:product:0+model/layer3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/layer3/BiasAdd
model/layer3/ReluRelumodel/layer3/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
model/layer3/Relu�
model/concatenate_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2!
model/concatenate_1/concat/axis�
model/concatenate_1/concatConcatV2model/multiply/mul:z:0model/layer3/Relu:activations:0(model/concatenate_1/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������2
model/concatenate_1/concat�
&model/prediction/MatMul/ReadVariableOpReadVariableOp/model_prediction_matmul_readvariableop_resource*
_output_shapes

:*
dtype02(
&model/prediction/MatMul/ReadVariableOp�
model/prediction/MatMulMatMul#model/concatenate_1/concat:output:0.model/prediction/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/prediction/MatMul�
'model/prediction/BiasAdd/ReadVariableOpReadVariableOp0model_prediction_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02)
'model/prediction/BiasAdd/ReadVariableOp�
model/prediction/BiasAddBiasAdd!model/prediction/MatMul:product:0/model/prediction/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
model/prediction/BiasAdd�
model/prediction/SigmoidSigmoid!model/prediction/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
model/prediction/Sigmoidw
IdentityIdentitymodel/prediction/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp$^model/layer0/BiasAdd/ReadVariableOp#^model/layer0/MatMul/ReadVariableOp$^model/layer1/BiasAdd/ReadVariableOp#^model/layer1/MatMul/ReadVariableOp$^model/layer2/BiasAdd/ReadVariableOp#^model/layer2/MatMul/ReadVariableOp$^model/layer3/BiasAdd/ReadVariableOp#^model/layer3/MatMul/ReadVariableOp%^model/mf_item/BiasAdd/ReadVariableOp$^model/mf_item/MatMul/ReadVariableOp%^model/mf_user/BiasAdd/ReadVariableOp$^model/mf_user/MatMul/ReadVariableOp&^model/mlp_item/BiasAdd/ReadVariableOp%^model/mlp_item/MatMul/ReadVariableOp&^model/mlp_user/BiasAdd/ReadVariableOp%^model/mlp_user/MatMul/ReadVariableOp(^model/prediction/BiasAdd/ReadVariableOp'^model/prediction/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 2J
#model/layer0/BiasAdd/ReadVariableOp#model/layer0/BiasAdd/ReadVariableOp2H
"model/layer0/MatMul/ReadVariableOp"model/layer0/MatMul/ReadVariableOp2J
#model/layer1/BiasAdd/ReadVariableOp#model/layer1/BiasAdd/ReadVariableOp2H
"model/layer1/MatMul/ReadVariableOp"model/layer1/MatMul/ReadVariableOp2J
#model/layer2/BiasAdd/ReadVariableOp#model/layer2/BiasAdd/ReadVariableOp2H
"model/layer2/MatMul/ReadVariableOp"model/layer2/MatMul/ReadVariableOp2J
#model/layer3/BiasAdd/ReadVariableOp#model/layer3/BiasAdd/ReadVariableOp2H
"model/layer3/MatMul/ReadVariableOp"model/layer3/MatMul/ReadVariableOp2L
$model/mf_item/BiasAdd/ReadVariableOp$model/mf_item/BiasAdd/ReadVariableOp2J
#model/mf_item/MatMul/ReadVariableOp#model/mf_item/MatMul/ReadVariableOp2L
$model/mf_user/BiasAdd/ReadVariableOp$model/mf_user/BiasAdd/ReadVariableOp2J
#model/mf_user/MatMul/ReadVariableOp#model/mf_user/MatMul/ReadVariableOp2N
%model/mlp_item/BiasAdd/ReadVariableOp%model/mlp_item/BiasAdd/ReadVariableOp2L
$model/mlp_item/MatMul/ReadVariableOp$model/mlp_item/MatMul/ReadVariableOp2N
%model/mlp_user/BiasAdd/ReadVariableOp%model/mlp_user/BiasAdd/ReadVariableOp2L
$model/mlp_user/MatMul/ReadVariableOp$model/mlp_user/MatMul/ReadVariableOp2R
'model/prediction/BiasAdd/ReadVariableOp'model/prediction/BiasAdd/ReadVariableOp2P
&model/prediction/MatMul/ReadVariableOp&model/prediction/MatMul/ReadVariableOp:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1:QM
(
_output_shapes
:����������
!
_user_specified_name	input_2
�
�
F__inference_prediction_layer_call_and_return_conditional_losses_210690

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAdda
SigmoidSigmoidBiasAdd:output:0*
T0*'
_output_shapes
:���������2	
Sigmoidf
IdentityIdentitySigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
s
G__inference_concatenate_layer_call_and_return_conditional_losses_211863
inputs_0
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������@2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:��������� :��������� :Q M
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/1
�
a
(__inference_dropout_layer_call_fn_211793

inputs
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_2109152
StatefulPartitionedCall|
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*(
_output_shapes
:����������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
��
�

A__inference_model_layer_call_and_return_conditional_losses_210745

inputs
inputs_1"
mlp_user_210481:	� 
mlp_user_210483: "
mlp_item_210498:	� 
mlp_item_210500: 
layer0_210536:@@
layer0_210538:@
layer1_210565:@ 
layer1_210567: 
layer2_210594: 
layer2_210596:!
mf_user_210611:	�
mf_user_210613:!
mf_item_210628:	�
mf_item_210630:
layer3_210665:
layer3_210667:#
prediction_210691:
prediction_210693:
identity��layer0/StatefulPartitionedCall�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�layer1/StatefulPartitionedCall�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�layer2/StatefulPartitionedCall�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�layer3/StatefulPartitionedCall�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�mf_item/StatefulPartitionedCall�mf_user/StatefulPartitionedCall� mlp_item/StatefulPartitionedCall� mlp_user/StatefulPartitionedCall�"prediction/StatefulPartitionedCall�
dropout/PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_2104672
dropout/PartitionedCall�
 mlp_user/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0mlp_user_210481mlp_user_210483*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_user_layer_call_and_return_conditional_losses_2104802"
 mlp_user/StatefulPartitionedCall�
 mlp_item/StatefulPartitionedCallStatefulPartitionedCallinputs_1mlp_item_210498mlp_item_210500*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_item_layer_call_and_return_conditional_losses_2104972"
 mlp_item/StatefulPartitionedCall�
concatenate/PartitionedCallPartitionedCall)mlp_user/StatefulPartitionedCall:output:0)mlp_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_2105102
concatenate/PartitionedCall�
layer0/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0layer0_210536layer0_210538*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer0_layer_call_and_return_conditional_losses_2105352 
layer0/StatefulPartitionedCall�
layer1/StatefulPartitionedCallStatefulPartitionedCall'layer0/StatefulPartitionedCall:output:0layer1_210565layer1_210567*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer1_layer_call_and_return_conditional_losses_2105642 
layer1/StatefulPartitionedCall�
layer2/StatefulPartitionedCallStatefulPartitionedCall'layer1/StatefulPartitionedCall:output:0layer2_210594layer2_210596*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer2_layer_call_and_return_conditional_losses_2105932 
layer2/StatefulPartitionedCall�
mf_user/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0mf_user_210611mf_user_210613*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_user_layer_call_and_return_conditional_losses_2106102!
mf_user/StatefulPartitionedCall�
mf_item/StatefulPartitionedCallStatefulPartitionedCallinputs_1mf_item_210628mf_item_210630*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_item_layer_call_and_return_conditional_losses_2106272!
mf_item/StatefulPartitionedCall�
multiply/PartitionedCallPartitionedCall(mf_user/StatefulPartitionedCall:output:0(mf_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_multiply_layer_call_and_return_conditional_losses_2106392
multiply/PartitionedCall�
layer3/StatefulPartitionedCallStatefulPartitionedCall'layer2/StatefulPartitionedCall:output:0layer3_210665layer3_210667*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer3_layer_call_and_return_conditional_losses_2106642 
layer3/StatefulPartitionedCall�
concatenate_1/PartitionedCallPartitionedCall!multiply/PartitionedCall:output:0'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_concatenate_1_layer_call_and_return_conditional_losses_2106772
concatenate_1/PartitionedCall�
"prediction/StatefulPartitionedCallStatefulPartitionedCall&concatenate_1/PartitionedCall:output:0prediction_210691prediction_210693*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_prediction_layer_call_and_return_conditional_losses_2106902$
"prediction/StatefulPartitionedCall�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer0_210536*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer0_210538*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mul�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer1_210565*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer1_210567*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mul�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer2_210594*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer2_210596*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mul�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer3_210665*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer3_210667*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mul�
IdentityIdentity+prediction/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^layer0/StatefulPartitionedCall.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp^layer1/StatefulPartitionedCall.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp^layer2/StatefulPartitionedCall.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp^layer3/StatefulPartitionedCall.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp ^mf_item/StatefulPartitionedCall ^mf_user/StatefulPartitionedCall!^mlp_item/StatefulPartitionedCall!^mlp_user/StatefulPartitionedCall#^prediction/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 2@
layer0/StatefulPartitionedCalllayer0/StatefulPartitionedCall2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp2B
mf_item/StatefulPartitionedCallmf_item/StatefulPartitionedCall2B
mf_user/StatefulPartitionedCallmf_user/StatefulPartitionedCall2D
 mlp_item/StatefulPartitionedCall mlp_item/StatefulPartitionedCall2D
 mlp_user/StatefulPartitionedCall mlp_user/StatefulPartitionedCall2H
"prediction/StatefulPartitionedCall"prediction/StatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
C__inference_mf_item_layer_call_and_return_conditional_losses_210627

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
D__inference_mlp_item_layer_call_and_return_conditional_losses_211850

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
n
D__inference_multiply_layer_call_and_return_conditional_losses_210639

inputs
inputs_1
identityU
mulMulinputsinputs_1*
T0*'
_output_shapes
:���������2
mul[
IdentityIdentitymul:z:0*
T0*'
_output_shapes
:���������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
D__inference_mlp_user_layer_call_and_return_conditional_losses_211830

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
ډ
�
A__inference_model_layer_call_and_return_conditional_losses_211065

inputs
inputs_1"
mlp_user_210968:	� 
mlp_user_210970: "
mlp_item_210973:	� 
mlp_item_210975: 
layer0_210979:@@
layer0_210981:@
layer1_210984:@ 
layer1_210986: 
layer2_210989: 
layer2_210991:!
mf_user_210994:	�
mf_user_210996:!
mf_item_210999:	�
mf_item_211001:
layer3_211005:
layer3_211007:#
prediction_211011:
prediction_211013:
identity��dropout/StatefulPartitionedCall�layer0/StatefulPartitionedCall�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�layer1/StatefulPartitionedCall�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�layer2/StatefulPartitionedCall�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�layer3/StatefulPartitionedCall�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�mf_item/StatefulPartitionedCall�mf_user/StatefulPartitionedCall� mlp_item/StatefulPartitionedCall� mlp_user/StatefulPartitionedCall�"prediction/StatefulPartitionedCall�
dropout/StatefulPartitionedCallStatefulPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_2109152!
dropout/StatefulPartitionedCall�
 mlp_user/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0mlp_user_210968mlp_user_210970*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_user_layer_call_and_return_conditional_losses_2104802"
 mlp_user/StatefulPartitionedCall�
 mlp_item/StatefulPartitionedCallStatefulPartitionedCallinputs_1mlp_item_210973mlp_item_210975*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_item_layer_call_and_return_conditional_losses_2104972"
 mlp_item/StatefulPartitionedCall�
concatenate/PartitionedCallPartitionedCall)mlp_user/StatefulPartitionedCall:output:0)mlp_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_2105102
concatenate/PartitionedCall�
layer0/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0layer0_210979layer0_210981*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer0_layer_call_and_return_conditional_losses_2105352 
layer0/StatefulPartitionedCall�
layer1/StatefulPartitionedCallStatefulPartitionedCall'layer0/StatefulPartitionedCall:output:0layer1_210984layer1_210986*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer1_layer_call_and_return_conditional_losses_2105642 
layer1/StatefulPartitionedCall�
layer2/StatefulPartitionedCallStatefulPartitionedCall'layer1/StatefulPartitionedCall:output:0layer2_210989layer2_210991*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer2_layer_call_and_return_conditional_losses_2105932 
layer2/StatefulPartitionedCall�
mf_user/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0mf_user_210994mf_user_210996*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_user_layer_call_and_return_conditional_losses_2106102!
mf_user/StatefulPartitionedCall�
mf_item/StatefulPartitionedCallStatefulPartitionedCallinputs_1mf_item_210999mf_item_211001*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_item_layer_call_and_return_conditional_losses_2106272!
mf_item/StatefulPartitionedCall�
multiply/PartitionedCallPartitionedCall(mf_user/StatefulPartitionedCall:output:0(mf_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_multiply_layer_call_and_return_conditional_losses_2106392
multiply/PartitionedCall�
layer3/StatefulPartitionedCallStatefulPartitionedCall'layer2/StatefulPartitionedCall:output:0layer3_211005layer3_211007*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer3_layer_call_and_return_conditional_losses_2106642 
layer3/StatefulPartitionedCall�
concatenate_1/PartitionedCallPartitionedCall!multiply/PartitionedCall:output:0'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_concatenate_1_layer_call_and_return_conditional_losses_2106772
concatenate_1/PartitionedCall�
"prediction/StatefulPartitionedCallStatefulPartitionedCall&concatenate_1/PartitionedCall:output:0prediction_211011prediction_211013*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_prediction_layer_call_and_return_conditional_losses_2106902$
"prediction/StatefulPartitionedCall�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer0_210979*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer0_210981*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mul�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer1_210984*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer1_210986*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mul�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer2_210989*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer2_210991*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mul�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer3_211005*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer3_211007*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mul�
IdentityIdentity+prediction/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp ^dropout/StatefulPartitionedCall^layer0/StatefulPartitionedCall.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp^layer1/StatefulPartitionedCall.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp^layer2/StatefulPartitionedCall.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp^layer3/StatefulPartitionedCall.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp ^mf_item/StatefulPartitionedCall ^mf_user/StatefulPartitionedCall!^mlp_item/StatefulPartitionedCall!^mlp_user/StatefulPartitionedCall#^prediction/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2@
layer0/StatefulPartitionedCalllayer0/StatefulPartitionedCall2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp2B
mf_item/StatefulPartitionedCallmf_item/StatefulPartitionedCall2B
mf_user/StatefulPartitionedCallmf_user/StatefulPartitionedCall2D
 mlp_item/StatefulPartitionedCall mlp_item/StatefulPartitionedCall2D
 mlp_user/StatefulPartitionedCall mlp_user/StatefulPartitionedCall2H
"prediction/StatefulPartitionedCall"prediction/StatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs:PL
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
(__inference_mf_item_layer_call_fn_211980

inputs
unknown:	�
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_item_layer_call_and_return_conditional_losses_2106272
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
$__inference_signature_wrapper_211448
input_1
input_2
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:@@
	unknown_4:@
	unknown_5:@ 
	unknown_6: 
	unknown_7: 
	unknown_8:
	unknown_9:	�

unknown_10:

unknown_11:	�

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1input_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� **
f%R#
!__inference__wrapped_model_2104532
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1:QM
(
_output_shapes
:����������
!
_user_specified_name	input_2
�
�
&__inference_model_layer_call_fn_211490
inputs_0
inputs_1
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:@@
	unknown_4:@
	unknown_5:@ 
	unknown_6: 
	unknown_7: 
	unknown_8:
	unknown_9:	�

unknown_10:

unknown_11:	�

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_layer_call_and_return_conditional_losses_2107452
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:R N
(
_output_shapes
:����������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1
�
�
)__inference_mlp_item_layer_call_fn_211839

inputs
unknown:	� 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_item_layer_call_and_return_conditional_losses_2104972
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
'__inference_layer3_layer_call_fn_212068

inputs
unknown:
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer3_layer_call_and_return_conditional_losses_2106642
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
X
,__inference_concatenate_layer_call_fn_211856
inputs_0
inputs_1
identity�
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_2105102
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:��������� :��������� :Q M
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:��������� 
"
_user_specified_name
inputs/1
�
�
B__inference_layer1_layer_call_and_return_conditional_losses_210564

inputs0
matmul_readvariableop_resource:@ -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@ *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
Relu�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
B__inference_layer3_layer_call_and_return_conditional_losses_210664

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relu�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
B__inference_layer2_layer_call_and_return_conditional_losses_210593

inputs0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relu�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:��������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�
�
__inference_loss_fn_6_212201J
8layer3_kernel_regularizer_square_readvariableop_resource:
identity��/layer3/kernel/Regularizer/Square/ReadVariableOp�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp8layer3_kernel_regularizer_square_readvariableop_resource*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mulk
IdentityIdentity!layer3/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity�
NoOpNoOp0^layer3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp
�
�
C__inference_mf_item_layer_call_and_return_conditional_losses_211991

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
B__inference_layer1_layer_call_and_return_conditional_losses_211951

inputs0
matmul_readvariableop_resource:@ -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@ *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
Relu�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
C__inference_mf_user_layer_call_and_return_conditional_losses_211971

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
B__inference_layer2_layer_call_and_return_conditional_losses_212035

inputs0
matmul_readvariableop_resource: -
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relu�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:��������� : : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�
�
'__inference_layer0_layer_call_fn_211884

inputs
unknown:@@
	unknown_0:@
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer0_layer_call_and_return_conditional_losses_2105352
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������@2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
q
G__inference_concatenate_layer_call_and_return_conditional_losses_210510

inputs
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������@2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������@2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:��������� :��������� :O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs:OK
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�
u
I__inference_concatenate_1_layer_call_and_return_conditional_losses_212104
inputs_0
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis�
concatConcatV2inputs_0inputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
a
C__inference_dropout_layer_call_and_return_conditional_losses_211798

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
)__inference_mlp_user_layer_call_fn_211819

inputs
unknown:	� 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_user_layer_call_and_return_conditional_losses_2104802
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
C__inference_mf_user_layer_call_and_return_conditional_losses_210610

inputs1
matmul_readvariableop_resource:	�-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
B__inference_layer0_layer_call_and_return_conditional_losses_211907

inputs0
matmul_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������@2
Relu�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������@2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
�
B__inference_layer3_layer_call_and_return_conditional_losses_212091

inputs0
matmul_readvariableop_resource:-
biasadd_readvariableop_resource:
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������2
Relu�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
�
&__inference_model_layer_call_fn_211146
input_1
input_2
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:@@
	unknown_4:@
	unknown_5:@ 
	unknown_6: 
	unknown_7: 
	unknown_8:
	unknown_9:	�

unknown_10:

unknown_11:	�

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1input_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_layer_call_and_return_conditional_losses_2110652
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1:QM
(
_output_shapes
:����������
!
_user_specified_name	input_2
ұ
�
A__inference_model_layer_call_and_return_conditional_losses_211783
inputs_0
inputs_1:
'mlp_user_matmul_readvariableop_resource:	� 6
(mlp_user_biasadd_readvariableop_resource: :
'mlp_item_matmul_readvariableop_resource:	� 6
(mlp_item_biasadd_readvariableop_resource: 7
%layer0_matmul_readvariableop_resource:@@4
&layer0_biasadd_readvariableop_resource:@7
%layer1_matmul_readvariableop_resource:@ 4
&layer1_biasadd_readvariableop_resource: 7
%layer2_matmul_readvariableop_resource: 4
&layer2_biasadd_readvariableop_resource:9
&mf_user_matmul_readvariableop_resource:	�5
'mf_user_biasadd_readvariableop_resource:9
&mf_item_matmul_readvariableop_resource:	�5
'mf_item_biasadd_readvariableop_resource:7
%layer3_matmul_readvariableop_resource:4
&layer3_biasadd_readvariableop_resource:;
)prediction_matmul_readvariableop_resource:8
*prediction_biasadd_readvariableop_resource:
identity��layer0/BiasAdd/ReadVariableOp�layer0/MatMul/ReadVariableOp�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�layer1/BiasAdd/ReadVariableOp�layer1/MatMul/ReadVariableOp�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�layer2/BiasAdd/ReadVariableOp�layer2/MatMul/ReadVariableOp�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�layer3/BiasAdd/ReadVariableOp�layer3/MatMul/ReadVariableOp�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�mf_item/BiasAdd/ReadVariableOp�mf_item/MatMul/ReadVariableOp�mf_user/BiasAdd/ReadVariableOp�mf_user/MatMul/ReadVariableOp�mlp_item/BiasAdd/ReadVariableOp�mlp_item/MatMul/ReadVariableOp�mlp_user/BiasAdd/ReadVariableOp�mlp_user/MatMul/ReadVariableOp�!prediction/BiasAdd/ReadVariableOp� prediction/MatMul/ReadVariableOps
dropout/dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/dropout/Const�
dropout/dropout/MulMulinputs_0dropout/dropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/dropout/Mulf
dropout/dropout/ShapeShapeinputs_0*
T0*
_output_shapes
:2
dropout/dropout/Shape�
,dropout/dropout/random_uniform/RandomUniformRandomUniformdropout/dropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype02.
,dropout/dropout/random_uniform/RandomUniform�
dropout/dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2 
dropout/dropout/GreaterEqual/y�
dropout/dropout/GreaterEqualGreaterEqual5dropout/dropout/random_uniform/RandomUniform:output:0'dropout/dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/dropout/GreaterEqual�
dropout/dropout/CastCast dropout/dropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/dropout/Cast�
dropout/dropout/Mul_1Muldropout/dropout/Mul:z:0dropout/dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/dropout/Mul_1�
mlp_user/MatMul/ReadVariableOpReadVariableOp'mlp_user_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype02 
mlp_user/MatMul/ReadVariableOp�
mlp_user/MatMulMatMuldropout/dropout/Mul_1:z:0&mlp_user/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_user/MatMul�
mlp_user/BiasAdd/ReadVariableOpReadVariableOp(mlp_user_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
mlp_user/BiasAdd/ReadVariableOp�
mlp_user/BiasAddBiasAddmlp_user/MatMul:product:0'mlp_user/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_user/BiasAdds
mlp_user/ReluRelumlp_user/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
mlp_user/Relu�
mlp_item/MatMul/ReadVariableOpReadVariableOp'mlp_item_matmul_readvariableop_resource*
_output_shapes
:	� *
dtype02 
mlp_item/MatMul/ReadVariableOp�
mlp_item/MatMulMatMulinputs_1&mlp_item/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_item/MatMul�
mlp_item/BiasAdd/ReadVariableOpReadVariableOp(mlp_item_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02!
mlp_item/BiasAdd/ReadVariableOp�
mlp_item/BiasAddBiasAddmlp_item/MatMul:product:0'mlp_item/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
mlp_item/BiasAdds
mlp_item/ReluRelumlp_item/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
mlp_item/Relut
concatenate/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate/concat/axis�
concatenate/concatConcatV2mlp_user/Relu:activations:0mlp_item/Relu:activations:0 concatenate/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������@2
concatenate/concat�
layer0/MatMul/ReadVariableOpReadVariableOp%layer0_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
layer0/MatMul/ReadVariableOp�
layer0/MatMulMatMulconcatenate/concat:output:0$layer0/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
layer0/MatMul�
layer0/BiasAdd/ReadVariableOpReadVariableOp&layer0_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
layer0/BiasAdd/ReadVariableOp�
layer0/BiasAddBiasAddlayer0/MatMul:product:0%layer0/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
layer0/BiasAddm
layer0/ReluRelulayer0/BiasAdd:output:0*
T0*'
_output_shapes
:���������@2
layer0/Relu�
layer1/MatMul/ReadVariableOpReadVariableOp%layer1_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype02
layer1/MatMul/ReadVariableOp�
layer1/MatMulMatMullayer0/Relu:activations:0$layer1/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
layer1/MatMul�
layer1/BiasAdd/ReadVariableOpReadVariableOp&layer1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02
layer1/BiasAdd/ReadVariableOp�
layer1/BiasAddBiasAddlayer1/MatMul:product:0%layer1/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
layer1/BiasAddm
layer1/ReluRelulayer1/BiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
layer1/Relu�
layer2/MatMul/ReadVariableOpReadVariableOp%layer2_matmul_readvariableop_resource*
_output_shapes

: *
dtype02
layer2/MatMul/ReadVariableOp�
layer2/MatMulMatMullayer1/Relu:activations:0$layer2/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer2/MatMul�
layer2/BiasAdd/ReadVariableOpReadVariableOp&layer2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer2/BiasAdd/ReadVariableOp�
layer2/BiasAddBiasAddlayer2/MatMul:product:0%layer2/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer2/BiasAddm
layer2/ReluRelulayer2/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
layer2/Relu�
mf_user/MatMul/ReadVariableOpReadVariableOp&mf_user_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
mf_user/MatMul/ReadVariableOp�
mf_user/MatMulMatMuldropout/dropout/Mul_1:z:0%mf_user/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_user/MatMul�
mf_user/BiasAdd/ReadVariableOpReadVariableOp'mf_user_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
mf_user/BiasAdd/ReadVariableOp�
mf_user/BiasAddBiasAddmf_user/MatMul:product:0&mf_user/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_user/BiasAddp
mf_user/ReluRelumf_user/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
mf_user/Relu�
mf_item/MatMul/ReadVariableOpReadVariableOp&mf_item_matmul_readvariableop_resource*
_output_shapes
:	�*
dtype02
mf_item/MatMul/ReadVariableOp�
mf_item/MatMulMatMulinputs_1%mf_item/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_item/MatMul�
mf_item/BiasAdd/ReadVariableOpReadVariableOp'mf_item_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02 
mf_item/BiasAdd/ReadVariableOp�
mf_item/BiasAddBiasAddmf_item/MatMul:product:0&mf_item/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
mf_item/BiasAddp
mf_item/ReluRelumf_item/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
mf_item/Relu�
multiply/mulMulmf_user/Relu:activations:0mf_item/Relu:activations:0*
T0*'
_output_shapes
:���������2
multiply/mul�
layer3/MatMul/ReadVariableOpReadVariableOp%layer3_matmul_readvariableop_resource*
_output_shapes

:*
dtype02
layer3/MatMul/ReadVariableOp�
layer3/MatMulMatMullayer2/Relu:activations:0$layer3/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer3/MatMul�
layer3/BiasAdd/ReadVariableOpReadVariableOp&layer3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02
layer3/BiasAdd/ReadVariableOp�
layer3/BiasAddBiasAddlayer3/MatMul:product:0%layer3/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
layer3/BiasAddm
layer3/ReluRelulayer3/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
layer3/Relux
concatenate_1/concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concatenate_1/concat/axis�
concatenate_1/concatConcatV2multiply/mul:z:0layer3/Relu:activations:0"concatenate_1/concat/axis:output:0*
N*
T0*'
_output_shapes
:���������2
concatenate_1/concat�
 prediction/MatMul/ReadVariableOpReadVariableOp)prediction_matmul_readvariableop_resource*
_output_shapes

:*
dtype02"
 prediction/MatMul/ReadVariableOp�
prediction/MatMulMatMulconcatenate_1/concat:output:0(prediction/MatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
prediction/MatMul�
!prediction/BiasAdd/ReadVariableOpReadVariableOp*prediction_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02#
!prediction/BiasAdd/ReadVariableOp�
prediction/BiasAddBiasAddprediction/MatMul:product:0)prediction/BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������2
prediction/BiasAdd�
prediction/SigmoidSigmoidprediction/BiasAdd:output:0*
T0*'
_output_shapes
:���������2
prediction/Sigmoid�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer0_matmul_readvariableop_resource*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer0_biasadd_readvariableop_resource*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mul�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer1_matmul_readvariableop_resource*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer1_biasadd_readvariableop_resource*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mul�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer2_matmul_readvariableop_resource*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer2_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mul�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOp%layer3_matmul_readvariableop_resource*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOp&layer3_biasadd_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mulq
IdentityIdentityprediction/Sigmoid:y:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^layer0/BiasAdd/ReadVariableOp^layer0/MatMul/ReadVariableOp.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp^layer1/BiasAdd/ReadVariableOp^layer1/MatMul/ReadVariableOp.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp^layer2/BiasAdd/ReadVariableOp^layer2/MatMul/ReadVariableOp.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp^layer3/BiasAdd/ReadVariableOp^layer3/MatMul/ReadVariableOp.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp^mf_item/BiasAdd/ReadVariableOp^mf_item/MatMul/ReadVariableOp^mf_user/BiasAdd/ReadVariableOp^mf_user/MatMul/ReadVariableOp ^mlp_item/BiasAdd/ReadVariableOp^mlp_item/MatMul/ReadVariableOp ^mlp_user/BiasAdd/ReadVariableOp^mlp_user/MatMul/ReadVariableOp"^prediction/BiasAdd/ReadVariableOp!^prediction/MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 2>
layer0/BiasAdd/ReadVariableOplayer0/BiasAdd/ReadVariableOp2<
layer0/MatMul/ReadVariableOplayer0/MatMul/ReadVariableOp2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp2>
layer1/BiasAdd/ReadVariableOplayer1/BiasAdd/ReadVariableOp2<
layer1/MatMul/ReadVariableOplayer1/MatMul/ReadVariableOp2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp2>
layer2/BiasAdd/ReadVariableOplayer2/BiasAdd/ReadVariableOp2<
layer2/MatMul/ReadVariableOplayer2/MatMul/ReadVariableOp2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp2>
layer3/BiasAdd/ReadVariableOplayer3/BiasAdd/ReadVariableOp2<
layer3/MatMul/ReadVariableOplayer3/MatMul/ReadVariableOp2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp2@
mf_item/BiasAdd/ReadVariableOpmf_item/BiasAdd/ReadVariableOp2>
mf_item/MatMul/ReadVariableOpmf_item/MatMul/ReadVariableOp2@
mf_user/BiasAdd/ReadVariableOpmf_user/BiasAdd/ReadVariableOp2>
mf_user/MatMul/ReadVariableOpmf_user/MatMul/ReadVariableOp2B
mlp_item/BiasAdd/ReadVariableOpmlp_item/BiasAdd/ReadVariableOp2@
mlp_item/MatMul/ReadVariableOpmlp_item/MatMul/ReadVariableOp2B
mlp_user/BiasAdd/ReadVariableOpmlp_user/BiasAdd/ReadVariableOp2@
mlp_user/MatMul/ReadVariableOpmlp_user/MatMul/ReadVariableOp2F
!prediction/BiasAdd/ReadVariableOp!prediction/BiasAdd/ReadVariableOp2D
 prediction/MatMul/ReadVariableOp prediction/MatMul/ReadVariableOp:R N
(
_output_shapes
:����������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1
�
b
C__inference_dropout_layer_call_and_return_conditional_losses_210915

inputs
identity�c
dropout/ConstConst*
_output_shapes
: *
dtype0*
valueB
 *   @2
dropout/Constt
dropout/MulMulinputsdropout/Const:output:0*
T0*(
_output_shapes
:����������2
dropout/MulT
dropout/ShapeShapeinputs*
T0*
_output_shapes
:2
dropout/Shape�
$dropout/random_uniform/RandomUniformRandomUniformdropout/Shape:output:0*
T0*(
_output_shapes
:����������*
dtype02&
$dropout/random_uniform/RandomUniformu
dropout/GreaterEqual/yConst*
_output_shapes
: *
dtype0*
valueB
 *   ?2
dropout/GreaterEqual/y�
dropout/GreaterEqualGreaterEqual-dropout/random_uniform/RandomUniform:output:0dropout/GreaterEqual/y:output:0*
T0*(
_output_shapes
:����������2
dropout/GreaterEqual�
dropout/CastCastdropout/GreaterEqual:z:0*

DstT0*

SrcT0
*(
_output_shapes
:����������2
dropout/Cast{
dropout/Mul_1Muldropout/Mul:z:0dropout/Cast:y:0*
T0*(
_output_shapes
:����������2
dropout/Mul_1f
IdentityIdentitydropout/Mul_1:z:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
D__inference_mlp_item_layer_call_and_return_conditional_losses_210497

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
��
�

A__inference_model_layer_call_and_return_conditional_losses_211248
input_1
input_2"
mlp_user_211151:	� 
mlp_user_211153: "
mlp_item_211156:	� 
mlp_item_211158: 
layer0_211162:@@
layer0_211164:@
layer1_211167:@ 
layer1_211169: 
layer2_211172: 
layer2_211174:!
mf_user_211177:	�
mf_user_211179:!
mf_item_211182:	�
mf_item_211184:
layer3_211188:
layer3_211190:#
prediction_211194:
prediction_211196:
identity��layer0/StatefulPartitionedCall�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�layer1/StatefulPartitionedCall�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�layer2/StatefulPartitionedCall�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�layer3/StatefulPartitionedCall�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�mf_item/StatefulPartitionedCall�mf_user/StatefulPartitionedCall� mlp_item/StatefulPartitionedCall� mlp_user/StatefulPartitionedCall�"prediction/StatefulPartitionedCall�
dropout/PartitionedCallPartitionedCallinput_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_2104672
dropout/PartitionedCall�
 mlp_user/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0mlp_user_211151mlp_user_211153*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_user_layer_call_and_return_conditional_losses_2104802"
 mlp_user/StatefulPartitionedCall�
 mlp_item/StatefulPartitionedCallStatefulPartitionedCallinput_2mlp_item_211156mlp_item_211158*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_item_layer_call_and_return_conditional_losses_2104972"
 mlp_item/StatefulPartitionedCall�
concatenate/PartitionedCallPartitionedCall)mlp_user/StatefulPartitionedCall:output:0)mlp_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_2105102
concatenate/PartitionedCall�
layer0/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0layer0_211162layer0_211164*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer0_layer_call_and_return_conditional_losses_2105352 
layer0/StatefulPartitionedCall�
layer1/StatefulPartitionedCallStatefulPartitionedCall'layer0/StatefulPartitionedCall:output:0layer1_211167layer1_211169*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer1_layer_call_and_return_conditional_losses_2105642 
layer1/StatefulPartitionedCall�
layer2/StatefulPartitionedCallStatefulPartitionedCall'layer1/StatefulPartitionedCall:output:0layer2_211172layer2_211174*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer2_layer_call_and_return_conditional_losses_2105932 
layer2/StatefulPartitionedCall�
mf_user/StatefulPartitionedCallStatefulPartitionedCall dropout/PartitionedCall:output:0mf_user_211177mf_user_211179*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_user_layer_call_and_return_conditional_losses_2106102!
mf_user/StatefulPartitionedCall�
mf_item/StatefulPartitionedCallStatefulPartitionedCallinput_2mf_item_211182mf_item_211184*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_item_layer_call_and_return_conditional_losses_2106272!
mf_item/StatefulPartitionedCall�
multiply/PartitionedCallPartitionedCall(mf_user/StatefulPartitionedCall:output:0(mf_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_multiply_layer_call_and_return_conditional_losses_2106392
multiply/PartitionedCall�
layer3/StatefulPartitionedCallStatefulPartitionedCall'layer2/StatefulPartitionedCall:output:0layer3_211188layer3_211190*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer3_layer_call_and_return_conditional_losses_2106642 
layer3/StatefulPartitionedCall�
concatenate_1/PartitionedCallPartitionedCall!multiply/PartitionedCall:output:0'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_concatenate_1_layer_call_and_return_conditional_losses_2106772
concatenate_1/PartitionedCall�
"prediction/StatefulPartitionedCallStatefulPartitionedCall&concatenate_1/PartitionedCall:output:0prediction_211194prediction_211196*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_prediction_layer_call_and_return_conditional_losses_2106902$
"prediction/StatefulPartitionedCall�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer0_211162*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer0_211164*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mul�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer1_211167*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer1_211169*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mul�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer2_211172*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer2_211174*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mul�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer3_211188*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer3_211190*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mul�
IdentityIdentity+prediction/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp^layer0/StatefulPartitionedCall.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp^layer1/StatefulPartitionedCall.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp^layer2/StatefulPartitionedCall.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp^layer3/StatefulPartitionedCall.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp ^mf_item/StatefulPartitionedCall ^mf_user/StatefulPartitionedCall!^mlp_item/StatefulPartitionedCall!^mlp_user/StatefulPartitionedCall#^prediction/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 2@
layer0/StatefulPartitionedCalllayer0/StatefulPartitionedCall2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp2B
mf_item/StatefulPartitionedCallmf_item/StatefulPartitionedCall2B
mf_user/StatefulPartitionedCallmf_user/StatefulPartitionedCall2D
 mlp_item/StatefulPartitionedCall mlp_item/StatefulPartitionedCall2D
 mlp_user/StatefulPartitionedCall mlp_user/StatefulPartitionedCall2H
"prediction/StatefulPartitionedCall"prediction/StatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1:QM
(
_output_shapes
:����������
!
_user_specified_name	input_2
�
D
(__inference_dropout_layer_call_fn_211788

inputs
identity�
PartitionedCallPartitionedCallinputs*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_2104672
PartitionedCallm
IdentityIdentityPartitionedCall:output:0*
T0*(
_output_shapes
:����������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
U
)__inference_multiply_layer_call_fn_212041
inputs_0
inputs_1
identity�
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_multiply_layer_call_and_return_conditional_losses_2106392
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
�
D__inference_mlp_user_layer_call_and_return_conditional_losses_210480

inputs1
matmul_readvariableop_resource:	� -
biasadd_readvariableop_resource: 
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes
:	� *
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
: *
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:��������� 2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:��������� 2
Relum
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identity
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
&__inference_model_layer_call_fn_210784
input_1
input_2
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:@@
	unknown_4:@
	unknown_5:@ 
	unknown_6: 
	unknown_7: 
	unknown_8:
	unknown_9:	�

unknown_10:

unknown_11:	�

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinput_1input_2unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_layer_call_and_return_conditional_losses_2107452
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1:QM
(
_output_shapes
:����������
!
_user_specified_name	input_2
�
�
__inference_loss_fn_5_212190D
6layer2_bias_regularizer_square_readvariableop_resource:
identity��-layer2/bias/Regularizer/Square/ReadVariableOp�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOp6layer2_bias_regularizer_square_readvariableop_resource*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/muli
IdentityIdentitylayer2/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity~
NoOpNoOp.^layer2/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp
�
�
__inference_loss_fn_4_212179J
8layer2_kernel_regularizer_square_readvariableop_resource: 
identity��/layer2/kernel/Regularizer/Square/ReadVariableOp�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOp8layer2_kernel_regularizer_square_readvariableop_resource*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mulk
IdentityIdentity!layer2/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity�
NoOpNoOp0^layer2/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp
�
�
__inference_loss_fn_1_212146D
6layer0_bias_regularizer_square_readvariableop_resource:@
identity��-layer0/bias/Regularizer/Square/ReadVariableOp�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOp6layer0_bias_regularizer_square_readvariableop_resource*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/muli
IdentityIdentitylayer0/bias/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity~
NoOpNoOp.^layer0/bias/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp
�
p
D__inference_multiply_layer_call_and_return_conditional_losses_212047
inputs_0
inputs_1
identityW
mulMulinputs_0inputs_1*
T0*'
_output_shapes
:���������2
mul[
IdentityIdentitymul:z:0*
T0*'
_output_shapes
:���������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
s
I__inference_concatenate_1_layer_call_and_return_conditional_losses_210677

inputs
inputs_1
identity\
concat/axisConst*
_output_shapes
: *
dtype0*
value	B :2
concat/axis
concatConcatV2inputsinputs_1concat/axis:output:0*
N*
T0*'
_output_shapes
:���������2
concatc
IdentityIdentityconcat:output:0*
T0*'
_output_shapes
:���������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:O K
'
_output_shapes
:���������
 
_user_specified_nameinputs:OK
'
_output_shapes
:���������
 
_user_specified_nameinputs
�
a
C__inference_dropout_layer_call_and_return_conditional_losses_210467

inputs

identity_1[
IdentityIdentityinputs*
T0*(
_output_shapes
:����������2

Identityj

Identity_1IdentityIdentity:output:0*
T0*(
_output_shapes
:����������2

Identity_1"!

identity_1Identity_1:output:0*(
_construction_contextkEagerRuntime*'
_input_shapes
:����������:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
(__inference_mf_user_layer_call_fn_211960

inputs
unknown:	�
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_user_layer_call_and_return_conditional_losses_2106102
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*+
_input_shapes
:����������: : 22
StatefulPartitionedCallStatefulPartitionedCall:P L
(
_output_shapes
:����������
 
_user_specified_nameinputs
�
�
'__inference_layer2_layer_call_fn_212012

inputs
unknown: 
	unknown_0:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer2_layer_call_and_return_conditional_losses_2105932
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:��������� : : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:��������� 
 
_user_specified_nameinputs
�
�
&__inference_model_layer_call_fn_211532
inputs_0
inputs_1
unknown:	� 
	unknown_0: 
	unknown_1:	� 
	unknown_2: 
	unknown_3:@@
	unknown_4:@
	unknown_5:@ 
	unknown_6: 
	unknown_7: 
	unknown_8:
	unknown_9:	�

unknown_10:

unknown_11:	�

unknown_12:

unknown_13:

unknown_14:

unknown_15:

unknown_16:
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputs_0inputs_1unknown	unknown_0	unknown_1	unknown_2	unknown_3	unknown_4	unknown_5	unknown_6	unknown_7	unknown_8	unknown_9
unknown_10
unknown_11
unknown_12
unknown_13
unknown_14
unknown_15
unknown_16*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*4
_read_only_resource_inputs
	
*-
config_proto

CPU

GPU 2J 8� *J
fERC
A__inference_model_layer_call_and_return_conditional_losses_2110652
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 22
StatefulPartitionedCallStatefulPartitionedCall:R N
(
_output_shapes
:����������
"
_user_specified_name
inputs/0:RN
(
_output_shapes
:����������
"
_user_specified_name
inputs/1
�
�
B__inference_layer0_layer_call_and_return_conditional_losses_210535

inputs0
matmul_readvariableop_resource:@@-
biasadd_readvariableop_resource:@
identity��BiasAdd/ReadVariableOp�MatMul/ReadVariableOp�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�
MatMul/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype02
MatMul/ReadVariableOps
MatMulMatMulinputsMatMul/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2
MatMul�
BiasAdd/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02
BiasAdd/ReadVariableOp�
BiasAddBiasAddMatMul:product:0BiasAdd/ReadVariableOp:value:0*
T0*'
_output_shapes
:���������@2	
BiasAddX
ReluReluBiasAdd:output:0*
T0*'
_output_shapes
:���������@2
Relu�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOpmatmul_readvariableop_resource*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOpbiasadd_readvariableop_resource*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mulm
IdentityIdentityRelu:activations:0^NoOp*
T0*'
_output_shapes
:���������@2

Identity�
NoOpNoOp^BiasAdd/ReadVariableOp^MatMul/ReadVariableOp.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 20
BiasAdd/ReadVariableOpBiasAdd/ReadVariableOp2.
MatMul/ReadVariableOpMatMul/ReadVariableOp2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
ۉ
�
A__inference_model_layer_call_and_return_conditional_losses_211350
input_1
input_2"
mlp_user_211253:	� 
mlp_user_211255: "
mlp_item_211258:	� 
mlp_item_211260: 
layer0_211264:@@
layer0_211266:@
layer1_211269:@ 
layer1_211271: 
layer2_211274: 
layer2_211276:!
mf_user_211279:	�
mf_user_211281:!
mf_item_211284:	�
mf_item_211286:
layer3_211290:
layer3_211292:#
prediction_211296:
prediction_211298:
identity��dropout/StatefulPartitionedCall�layer0/StatefulPartitionedCall�-layer0/bias/Regularizer/Square/ReadVariableOp�/layer0/kernel/Regularizer/Square/ReadVariableOp�layer1/StatefulPartitionedCall�-layer1/bias/Regularizer/Square/ReadVariableOp�/layer1/kernel/Regularizer/Square/ReadVariableOp�layer2/StatefulPartitionedCall�-layer2/bias/Regularizer/Square/ReadVariableOp�/layer2/kernel/Regularizer/Square/ReadVariableOp�layer3/StatefulPartitionedCall�-layer3/bias/Regularizer/Square/ReadVariableOp�/layer3/kernel/Regularizer/Square/ReadVariableOp�mf_item/StatefulPartitionedCall�mf_user/StatefulPartitionedCall� mlp_item/StatefulPartitionedCall� mlp_user/StatefulPartitionedCall�"prediction/StatefulPartitionedCall�
dropout/StatefulPartitionedCallStatefulPartitionedCallinput_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *(
_output_shapes
:����������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_dropout_layer_call_and_return_conditional_losses_2109152!
dropout/StatefulPartitionedCall�
 mlp_user/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0mlp_user_211253mlp_user_211255*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_user_layer_call_and_return_conditional_losses_2104802"
 mlp_user/StatefulPartitionedCall�
 mlp_item/StatefulPartitionedCallStatefulPartitionedCallinput_2mlp_item_211258mlp_item_211260*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_mlp_item_layer_call_and_return_conditional_losses_2104972"
 mlp_item/StatefulPartitionedCall�
concatenate/PartitionedCallPartitionedCall)mlp_user/StatefulPartitionedCall:output:0)mlp_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *P
fKRI
G__inference_concatenate_layer_call_and_return_conditional_losses_2105102
concatenate/PartitionedCall�
layer0/StatefulPartitionedCallStatefulPartitionedCall$concatenate/PartitionedCall:output:0layer0_211264layer0_211266*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������@*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer0_layer_call_and_return_conditional_losses_2105352 
layer0/StatefulPartitionedCall�
layer1/StatefulPartitionedCallStatefulPartitionedCall'layer0/StatefulPartitionedCall:output:0layer1_211269layer1_211271*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer1_layer_call_and_return_conditional_losses_2105642 
layer1/StatefulPartitionedCall�
layer2/StatefulPartitionedCallStatefulPartitionedCall'layer1/StatefulPartitionedCall:output:0layer2_211274layer2_211276*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer2_layer_call_and_return_conditional_losses_2105932 
layer2/StatefulPartitionedCall�
mf_user/StatefulPartitionedCallStatefulPartitionedCall(dropout/StatefulPartitionedCall:output:0mf_user_211279mf_user_211281*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_user_layer_call_and_return_conditional_losses_2106102!
mf_user/StatefulPartitionedCall�
mf_item/StatefulPartitionedCallStatefulPartitionedCallinput_2mf_item_211284mf_item_211286*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *L
fGRE
C__inference_mf_item_layer_call_and_return_conditional_losses_2106272!
mf_item/StatefulPartitionedCall�
multiply/PartitionedCallPartitionedCall(mf_user/StatefulPartitionedCall:output:0(mf_item/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *M
fHRF
D__inference_multiply_layer_call_and_return_conditional_losses_2106392
multiply/PartitionedCall�
layer3/StatefulPartitionedCallStatefulPartitionedCall'layer2/StatefulPartitionedCall:output:0layer3_211290layer3_211292*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer3_layer_call_and_return_conditional_losses_2106642 
layer3/StatefulPartitionedCall�
concatenate_1/PartitionedCallPartitionedCall!multiply/PartitionedCall:output:0'layer3/StatefulPartitionedCall:output:0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_concatenate_1_layer_call_and_return_conditional_losses_2106772
concatenate_1/PartitionedCall�
"prediction/StatefulPartitionedCallStatefulPartitionedCall&concatenate_1/PartitionedCall:output:0prediction_211296prediction_211298*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������*$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *O
fJRH
F__inference_prediction_layer_call_and_return_conditional_losses_2106902$
"prediction/StatefulPartitionedCall�
/layer0/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer0_211264*
_output_shapes

:@@*
dtype021
/layer0/kernel/Regularizer/Square/ReadVariableOp�
 layer0/kernel/Regularizer/SquareSquare7layer0/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@@2"
 layer0/kernel/Regularizer/Square�
layer0/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer0/kernel/Regularizer/Const�
layer0/kernel/Regularizer/SumSum$layer0/kernel/Regularizer/Square:y:0(layer0/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/Sum�
layer0/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer0/kernel/Regularizer/mul/x�
layer0/kernel/Regularizer/mulMul(layer0/kernel/Regularizer/mul/x:output:0&layer0/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/kernel/Regularizer/mul�
-layer0/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer0_211266*
_output_shapes
:@*
dtype02/
-layer0/bias/Regularizer/Square/ReadVariableOp�
layer0/bias/Regularizer/SquareSquare5layer0/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:@2 
layer0/bias/Regularizer/Square�
layer0/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer0/bias/Regularizer/Const�
layer0/bias/Regularizer/SumSum"layer0/bias/Regularizer/Square:y:0&layer0/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/Sum�
layer0/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer0/bias/Regularizer/mul/x�
layer0/bias/Regularizer/mulMul&layer0/bias/Regularizer/mul/x:output:0$layer0/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer0/bias/Regularizer/mul�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer1_211269*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mul�
-layer1/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer1_211271*
_output_shapes
: *
dtype02/
-layer1/bias/Regularizer/Square/ReadVariableOp�
layer1/bias/Regularizer/SquareSquare5layer1/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
: 2 
layer1/bias/Regularizer/Square�
layer1/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer1/bias/Regularizer/Const�
layer1/bias/Regularizer/SumSum"layer1/bias/Regularizer/Square:y:0&layer1/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/Sum�
layer1/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer1/bias/Regularizer/mul/x�
layer1/bias/Regularizer/mulMul&layer1/bias/Regularizer/mul/x:output:0$layer1/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/bias/Regularizer/mul�
/layer2/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer2_211274*
_output_shapes

: *
dtype021
/layer2/kernel/Regularizer/Square/ReadVariableOp�
 layer2/kernel/Regularizer/SquareSquare7layer2/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

: 2"
 layer2/kernel/Regularizer/Square�
layer2/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer2/kernel/Regularizer/Const�
layer2/kernel/Regularizer/SumSum$layer2/kernel/Regularizer/Square:y:0(layer2/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/Sum�
layer2/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer2/kernel/Regularizer/mul/x�
layer2/kernel/Regularizer/mulMul(layer2/kernel/Regularizer/mul/x:output:0&layer2/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/kernel/Regularizer/mul�
-layer2/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer2_211276*
_output_shapes
:*
dtype02/
-layer2/bias/Regularizer/Square/ReadVariableOp�
layer2/bias/Regularizer/SquareSquare5layer2/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer2/bias/Regularizer/Square�
layer2/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer2/bias/Regularizer/Const�
layer2/bias/Regularizer/SumSum"layer2/bias/Regularizer/Square:y:0&layer2/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/Sum�
layer2/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer2/bias/Regularizer/mul/x�
layer2/bias/Regularizer/mulMul&layer2/bias/Regularizer/mul/x:output:0$layer2/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer2/bias/Regularizer/mul�
/layer3/kernel/Regularizer/Square/ReadVariableOpReadVariableOplayer3_211290*
_output_shapes

:*
dtype021
/layer3/kernel/Regularizer/Square/ReadVariableOp�
 layer3/kernel/Regularizer/SquareSquare7layer3/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:2"
 layer3/kernel/Regularizer/Square�
layer3/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer3/kernel/Regularizer/Const�
layer3/kernel/Regularizer/SumSum$layer3/kernel/Regularizer/Square:y:0(layer3/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/Sum�
layer3/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer3/kernel/Regularizer/mul/x�
layer3/kernel/Regularizer/mulMul(layer3/kernel/Regularizer/mul/x:output:0&layer3/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/kernel/Regularizer/mul�
-layer3/bias/Regularizer/Square/ReadVariableOpReadVariableOplayer3_211292*
_output_shapes
:*
dtype02/
-layer3/bias/Regularizer/Square/ReadVariableOp�
layer3/bias/Regularizer/SquareSquare5layer3/bias/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes
:2 
layer3/bias/Regularizer/Square�
layer3/bias/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB: 2
layer3/bias/Regularizer/Const�
layer3/bias/Regularizer/SumSum"layer3/bias/Regularizer/Square:y:0&layer3/bias/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/Sum�
layer3/bias/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2
layer3/bias/Regularizer/mul/x�
layer3/bias/Regularizer/mulMul&layer3/bias/Regularizer/mul/x:output:0$layer3/bias/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer3/bias/Regularizer/mul�
IdentityIdentity+prediction/StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:���������2

Identity�
NoOpNoOp ^dropout/StatefulPartitionedCall^layer0/StatefulPartitionedCall.^layer0/bias/Regularizer/Square/ReadVariableOp0^layer0/kernel/Regularizer/Square/ReadVariableOp^layer1/StatefulPartitionedCall.^layer1/bias/Regularizer/Square/ReadVariableOp0^layer1/kernel/Regularizer/Square/ReadVariableOp^layer2/StatefulPartitionedCall.^layer2/bias/Regularizer/Square/ReadVariableOp0^layer2/kernel/Regularizer/Square/ReadVariableOp^layer3/StatefulPartitionedCall.^layer3/bias/Regularizer/Square/ReadVariableOp0^layer3/kernel/Regularizer/Square/ReadVariableOp ^mf_item/StatefulPartitionedCall ^mf_user/StatefulPartitionedCall!^mlp_item/StatefulPartitionedCall!^mlp_user/StatefulPartitionedCall#^prediction/StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*_
_input_shapesN
L:����������:����������: : : : : : : : : : : : : : : : : : 2B
dropout/StatefulPartitionedCalldropout/StatefulPartitionedCall2@
layer0/StatefulPartitionedCalllayer0/StatefulPartitionedCall2^
-layer0/bias/Regularizer/Square/ReadVariableOp-layer0/bias/Regularizer/Square/ReadVariableOp2b
/layer0/kernel/Regularizer/Square/ReadVariableOp/layer0/kernel/Regularizer/Square/ReadVariableOp2@
layer1/StatefulPartitionedCalllayer1/StatefulPartitionedCall2^
-layer1/bias/Regularizer/Square/ReadVariableOp-layer1/bias/Regularizer/Square/ReadVariableOp2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp2@
layer2/StatefulPartitionedCalllayer2/StatefulPartitionedCall2^
-layer2/bias/Regularizer/Square/ReadVariableOp-layer2/bias/Regularizer/Square/ReadVariableOp2b
/layer2/kernel/Regularizer/Square/ReadVariableOp/layer2/kernel/Regularizer/Square/ReadVariableOp2@
layer3/StatefulPartitionedCalllayer3/StatefulPartitionedCall2^
-layer3/bias/Regularizer/Square/ReadVariableOp-layer3/bias/Regularizer/Square/ReadVariableOp2b
/layer3/kernel/Regularizer/Square/ReadVariableOp/layer3/kernel/Regularizer/Square/ReadVariableOp2B
mf_item/StatefulPartitionedCallmf_item/StatefulPartitionedCall2B
mf_user/StatefulPartitionedCallmf_user/StatefulPartitionedCall2D
 mlp_item/StatefulPartitionedCall mlp_item/StatefulPartitionedCall2D
 mlp_user/StatefulPartitionedCall mlp_user/StatefulPartitionedCall2H
"prediction/StatefulPartitionedCall"prediction/StatefulPartitionedCall:Q M
(
_output_shapes
:����������
!
_user_specified_name	input_1:QM
(
_output_shapes
:����������
!
_user_specified_name	input_2
�
�
'__inference_layer1_layer_call_fn_211928

inputs
unknown:@ 
	unknown_0: 
identity��StatefulPartitionedCall�
StatefulPartitionedCallStatefulPartitionedCallinputsunknown	unknown_0*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:��������� *$
_read_only_resource_inputs
*-
config_proto

CPU

GPU 2J 8� *K
fFRD
B__inference_layer1_layer_call_and_return_conditional_losses_2105642
StatefulPartitionedCall{
IdentityIdentity StatefulPartitionedCall:output:0^NoOp*
T0*'
_output_shapes
:��������� 2

Identityh
NoOpNoOp^StatefulPartitionedCall*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime**
_input_shapes
:���������@: : 22
StatefulPartitionedCallStatefulPartitionedCall:O K
'
_output_shapes
:���������@
 
_user_specified_nameinputs
�
Z
.__inference_concatenate_1_layer_call_fn_212097
inputs_0
inputs_1
identity�
PartitionedCallPartitionedCallinputs_0inputs_1*
Tin
2*
Tout
2*
_collective_manager_ids
 *'
_output_shapes
:���������* 
_read_only_resource_inputs
 *-
config_proto

CPU

GPU 2J 8� *R
fMRK
I__inference_concatenate_1_layer_call_and_return_conditional_losses_2106772
PartitionedCalll
IdentityIdentityPartitionedCall:output:0*
T0*'
_output_shapes
:���������2

Identity"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*9
_input_shapes(
&:���������:���������:Q M
'
_output_shapes
:���������
"
_user_specified_name
inputs/0:QM
'
_output_shapes
:���������
"
_user_specified_name
inputs/1
�
�
__inference_loss_fn_2_212157J
8layer1_kernel_regularizer_square_readvariableop_resource:@ 
identity��/layer1/kernel/Regularizer/Square/ReadVariableOp�
/layer1/kernel/Regularizer/Square/ReadVariableOpReadVariableOp8layer1_kernel_regularizer_square_readvariableop_resource*
_output_shapes

:@ *
dtype021
/layer1/kernel/Regularizer/Square/ReadVariableOp�
 layer1/kernel/Regularizer/SquareSquare7layer1/kernel/Regularizer/Square/ReadVariableOp:value:0*
T0*
_output_shapes

:@ 2"
 layer1/kernel/Regularizer/Square�
layer1/kernel/Regularizer/ConstConst*
_output_shapes
:*
dtype0*
valueB"       2!
layer1/kernel/Regularizer/Const�
layer1/kernel/Regularizer/SumSum$layer1/kernel/Regularizer/Square:y:0(layer1/kernel/Regularizer/Const:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/Sum�
layer1/kernel/Regularizer/mul/xConst*
_output_shapes
: *
dtype0*
valueB
 *    2!
layer1/kernel/Regularizer/mul/x�
layer1/kernel/Regularizer/mulMul(layer1/kernel/Regularizer/mul/x:output:0&layer1/kernel/Regularizer/Sum:output:0*
T0*
_output_shapes
: 2
layer1/kernel/Regularizer/mulk
IdentityIdentity!layer1/kernel/Regularizer/mul:z:0^NoOp*
T0*
_output_shapes
: 2

Identity�
NoOpNoOp0^layer1/kernel/Regularizer/Square/ReadVariableOp*"
_acd_function_control_output(*
_output_shapes
 2
NoOp"
identityIdentity:output:0*(
_construction_contextkEagerRuntime*
_input_shapes
: 2b
/layer1/kernel/Regularizer/Square/ReadVariableOp/layer1/kernel/Regularizer/Square/ReadVariableOp"�L
saver_filename:0StatefulPartitionedCall_1:0StatefulPartitionedCall_28"
saved_model_main_op

NoOp*>
__saved_model_init_op%#
__saved_model_init_op

NoOp*�
serving_default�
<
input_11
serving_default_input_1:0����������
<
input_21
serving_default_input_2:0����������>

prediction0
StatefulPartitionedCall:0���������tensorflow/serving/predict:��
�
layer-0
layer-1
layer-2
layer_with_weights-0
layer-3
layer_with_weights-1
layer-4
layer-5
layer_with_weights-2
layer-6
layer_with_weights-3
layer-7
	layer_with_weights-4
	layer-8

layer_with_weights-5

layer-9
layer_with_weights-6
layer-10
layer-11
layer_with_weights-7
layer-12
layer-13
layer_with_weights-8
layer-14
	optimizer
	variables
regularization_losses
trainable_variables
	keras_api

signatures
�__call__
+�&call_and_return_all_conditional_losses
�_default_save_signature"
_tf_keras_network
"
_tf_keras_input_layer
�
	variables
regularization_losses
trainable_variables
	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
"
_tf_keras_input_layer
�

kernel
bias
	variables
regularization_losses
trainable_variables
	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

 kernel
!bias
"	variables
#regularization_losses
$trainable_variables
%	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
&	variables
'regularization_losses
(trainable_variables
)	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

*kernel
+bias
,	variables
-regularization_losses
.trainable_variables
/	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

0kernel
1bias
2	variables
3regularization_losses
4trainable_variables
5	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

6kernel
7bias
8	variables
9regularization_losses
:trainable_variables
;	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

<kernel
=bias
>	variables
?regularization_losses
@trainable_variables
A	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

Bkernel
Cbias
D	variables
Eregularization_losses
Ftrainable_variables
G	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
H	variables
Iregularization_losses
Jtrainable_variables
K	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

Lkernel
Mbias
N	variables
Oregularization_losses
Ptrainable_variables
Q	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
R	variables
Sregularization_losses
Ttrainable_variables
U	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�

Vkernel
Wbias
X	variables
Yregularization_losses
Ztrainable_variables
[	keras_api
�__call__
+�&call_and_return_all_conditional_losses"
_tf_keras_layer
�
\iter

]beta_1

^beta_2
	_decay
`learning_ratem�m� m�!m�*m�+m�0m�1m�6m�7m�<m�=m�Bm�Cm�Lm�Mm�Vm�Wm�v�v� v�!v�*v�+v�0v�1v�6v�7v�<v�=v�Bv�Cv�Lv�Mv�Vv�Wv�"
	optimizer
�
0
1
 2
!3
*4
+5
06
17
68
79
<10
=11
B12
C13
L14
M15
V16
W17"
trackable_list_wrapper
`
�0
�1
�2
�3
�4
�5
�6
�7"
trackable_list_wrapper
�
0
1
 2
!3
*4
+5
06
17
68
79
<10
=11
B12
C13
L14
M15
V16
W17"
trackable_list_wrapper
�
	variables

alayers
blayer_regularization_losses
regularization_losses
cnon_trainable_variables
dmetrics
trainable_variables
elayer_metrics
�__call__
�_default_save_signature
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
-
�serving_default"
signature_map
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
	variables

flayers
glayer_regularization_losses
regularization_losses
hnon_trainable_variables
imetrics
trainable_variables
jlayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
": 	� 2mlp_user/kernel
: 2mlp_user/bias
.
0
1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
0
1"
trackable_list_wrapper
�
	variables

klayers
llayer_regularization_losses
regularization_losses
mnon_trainable_variables
nmetrics
trainable_variables
olayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
": 	� 2mlp_item/kernel
: 2mlp_item/bias
.
 0
!1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
 0
!1"
trackable_list_wrapper
�
"	variables

players
qlayer_regularization_losses
#regularization_losses
rnon_trainable_variables
smetrics
$trainable_variables
tlayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
&	variables

ulayers
vlayer_regularization_losses
'regularization_losses
wnon_trainable_variables
xmetrics
(trainable_variables
ylayer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:@@2layer0/kernel
:@2layer0/bias
.
*0
+1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
.
*0
+1"
trackable_list_wrapper
�
,	variables

zlayers
{layer_regularization_losses
-regularization_losses
|non_trainable_variables
}metrics
.trainable_variables
~layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:@ 2layer1/kernel
: 2layer1/bias
.
00
11"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
.
00
11"
trackable_list_wrapper
�
2	variables

layers
 �layer_regularization_losses
3regularization_losses
�non_trainable_variables
�metrics
4trainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
!:	�2mf_user/kernel
:2mf_user/bias
.
60
71"
trackable_list_wrapper
 "
trackable_list_wrapper
.
60
71"
trackable_list_wrapper
�
8	variables
�layers
 �layer_regularization_losses
9regularization_losses
�non_trainable_variables
�metrics
:trainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
!:	�2mf_item/kernel
:2mf_item/bias
.
<0
=1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
<0
=1"
trackable_list_wrapper
�
>	variables
�layers
 �layer_regularization_losses
?regularization_losses
�non_trainable_variables
�metrics
@trainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
: 2layer2/kernel
:2layer2/bias
.
B0
C1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
.
B0
C1"
trackable_list_wrapper
�
D	variables
�layers
 �layer_regularization_losses
Eregularization_losses
�non_trainable_variables
�metrics
Ftrainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
H	variables
�layers
 �layer_regularization_losses
Iregularization_losses
�non_trainable_variables
�metrics
Jtrainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:2layer3/kernel
:2layer3/bias
.
L0
M1"
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
.
L0
M1"
trackable_list_wrapper
�
N	variables
�layers
 �layer_regularization_losses
Oregularization_losses
�non_trainable_variables
�metrics
Ptrainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
�
R	variables
�layers
 �layer_regularization_losses
Sregularization_losses
�non_trainable_variables
�metrics
Ttrainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
#:!2prediction/kernel
:2prediction/bias
.
V0
W1"
trackable_list_wrapper
 "
trackable_list_wrapper
.
V0
W1"
trackable_list_wrapper
�
X	variables
�layers
 �layer_regularization_losses
Yregularization_losses
�non_trainable_variables
�metrics
Ztrainable_variables
�layer_metrics
�__call__
+�&call_and_return_all_conditional_losses
'�"call_and_return_conditional_losses"
_generic_user_object
:	 (2	Adam/iter
: (2Adam/beta_1
: (2Adam/beta_2
: (2
Adam/decay
: (2Adam/learning_rate
�
0
1
2
3
4
5
6
7
	8

9
10
11
12
13
14"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
@
�0
�1
�2
�3"
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
0
�0
�1"
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_list_wrapper
 "
trackable_dict_wrapper
R

�total

�count
�	variables
�	keras_api"
_tf_keras_metric
c

�total

�count
�
_fn_kwargs
�	variables
�	keras_api"
_tf_keras_metric
v
�
thresholds
�true_positives
�false_negatives
�	variables
�	keras_api"
_tf_keras_metric
v
�
thresholds
�true_positives
�false_positives
�	variables
�	keras_api"
_tf_keras_metric
:  (2total
:  (2count
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
:  (2total
:  (2count
 "
trackable_dict_wrapper
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
 "
trackable_list_wrapper
: (2true_positives
: (2false_negatives
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
 "
trackable_list_wrapper
: (2true_positives
: (2false_positives
0
�0
�1"
trackable_list_wrapper
.
�	variables"
_generic_user_object
':%	� 2Adam/mlp_user/kernel/m
 : 2Adam/mlp_user/bias/m
':%	� 2Adam/mlp_item/kernel/m
 : 2Adam/mlp_item/bias/m
$:"@@2Adam/layer0/kernel/m
:@2Adam/layer0/bias/m
$:"@ 2Adam/layer1/kernel/m
: 2Adam/layer1/bias/m
&:$	�2Adam/mf_user/kernel/m
:2Adam/mf_user/bias/m
&:$	�2Adam/mf_item/kernel/m
:2Adam/mf_item/bias/m
$:" 2Adam/layer2/kernel/m
:2Adam/layer2/bias/m
$:"2Adam/layer3/kernel/m
:2Adam/layer3/bias/m
(:&2Adam/prediction/kernel/m
": 2Adam/prediction/bias/m
':%	� 2Adam/mlp_user/kernel/v
 : 2Adam/mlp_user/bias/v
':%	� 2Adam/mlp_item/kernel/v
 : 2Adam/mlp_item/bias/v
$:"@@2Adam/layer0/kernel/v
:@2Adam/layer0/bias/v
$:"@ 2Adam/layer1/kernel/v
: 2Adam/layer1/bias/v
&:$	�2Adam/mf_user/kernel/v
:2Adam/mf_user/bias/v
&:$	�2Adam/mf_item/kernel/v
:2Adam/mf_item/bias/v
$:" 2Adam/layer2/kernel/v
:2Adam/layer2/bias/v
$:"2Adam/layer3/kernel/v
:2Adam/layer3/bias/v
(:&2Adam/prediction/kernel/v
": 2Adam/prediction/bias/v
�2�
&__inference_model_layer_call_fn_210784
&__inference_model_layer_call_fn_211490
&__inference_model_layer_call_fn_211532
&__inference_model_layer_call_fn_211146�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
A__inference_model_layer_call_and_return_conditional_losses_211654
A__inference_model_layer_call_and_return_conditional_losses_211783
A__inference_model_layer_call_and_return_conditional_losses_211248
A__inference_model_layer_call_and_return_conditional_losses_211350�
���
FullArgSpec1
args)�&
jself
jinputs

jtraining
jmask
varargs
 
varkw
 
defaults�
p 

 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�B�
!__inference__wrapped_model_210453input_1input_2"�
���
FullArgSpec
args� 
varargsjargs
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_dropout_layer_call_fn_211788
(__inference_dropout_layer_call_fn_211793�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
C__inference_dropout_layer_call_and_return_conditional_losses_211798
C__inference_dropout_layer_call_and_return_conditional_losses_211810�
���
FullArgSpec)
args!�
jself
jinputs

jtraining
varargs
 
varkw
 
defaults�
p 

kwonlyargs� 
kwonlydefaults� 
annotations� *
 
�2�
)__inference_mlp_user_layer_call_fn_211819�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_mlp_user_layer_call_and_return_conditional_losses_211830�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_mlp_item_layer_call_fn_211839�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_mlp_item_layer_call_and_return_conditional_losses_211850�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
,__inference_concatenate_layer_call_fn_211856�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
G__inference_concatenate_layer_call_and_return_conditional_losses_211863�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_layer0_layer_call_fn_211884�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_layer0_layer_call_and_return_conditional_losses_211907�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_layer1_layer_call_fn_211928�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_layer1_layer_call_and_return_conditional_losses_211951�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_mf_user_layer_call_fn_211960�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_mf_user_layer_call_and_return_conditional_losses_211971�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
(__inference_mf_item_layer_call_fn_211980�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
C__inference_mf_item_layer_call_and_return_conditional_losses_211991�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_layer2_layer_call_fn_212012�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_layer2_layer_call_and_return_conditional_losses_212035�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
)__inference_multiply_layer_call_fn_212041�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
D__inference_multiply_layer_call_and_return_conditional_losses_212047�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
'__inference_layer3_layer_call_fn_212068�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
B__inference_layer3_layer_call_and_return_conditional_losses_212091�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
.__inference_concatenate_1_layer_call_fn_212097�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
I__inference_concatenate_1_layer_call_and_return_conditional_losses_212104�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
+__inference_prediction_layer_call_fn_212113�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
F__inference_prediction_layer_call_and_return_conditional_losses_212124�
���
FullArgSpec
args�
jself
jinputs
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 
�2�
__inference_loss_fn_0_212135�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_1_212146�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_2_212157�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_3_212168�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_4_212179�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_5_212190�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_6_212201�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�2�
__inference_loss_fn_7_212212�
���
FullArgSpec
args� 
varargs
 
varkw
 
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *� 
�B�
$__inference_signature_wrapper_211448input_1input_2"�
���
FullArgSpec
args� 
varargs
 
varkwjkwargs
defaults
 

kwonlyargs� 
kwonlydefaults
 
annotations� *
 �
!__inference__wrapped_model_210453� !*+01BC67<=LMVWZ�W
P�M
K�H
"�
input_1����������
"�
input_2����������
� "7�4
2

prediction$�!

prediction����������
I__inference_concatenate_1_layer_call_and_return_conditional_losses_212104�Z�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "%�"
�
0���������
� �
.__inference_concatenate_1_layer_call_fn_212097vZ�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "�����������
G__inference_concatenate_layer_call_and_return_conditional_losses_211863�Z�W
P�M
K�H
"�
inputs/0��������� 
"�
inputs/1��������� 
� "%�"
�
0���������@
� �
,__inference_concatenate_layer_call_fn_211856vZ�W
P�M
K�H
"�
inputs/0��������� 
"�
inputs/1��������� 
� "����������@�
C__inference_dropout_layer_call_and_return_conditional_losses_211798^4�1
*�'
!�
inputs����������
p 
� "&�#
�
0����������
� �
C__inference_dropout_layer_call_and_return_conditional_losses_211810^4�1
*�'
!�
inputs����������
p
� "&�#
�
0����������
� }
(__inference_dropout_layer_call_fn_211788Q4�1
*�'
!�
inputs����������
p 
� "�����������}
(__inference_dropout_layer_call_fn_211793Q4�1
*�'
!�
inputs����������
p
� "������������
B__inference_layer0_layer_call_and_return_conditional_losses_211907\*+/�,
%�"
 �
inputs���������@
� "%�"
�
0���������@
� z
'__inference_layer0_layer_call_fn_211884O*+/�,
%�"
 �
inputs���������@
� "����������@�
B__inference_layer1_layer_call_and_return_conditional_losses_211951\01/�,
%�"
 �
inputs���������@
� "%�"
�
0��������� 
� z
'__inference_layer1_layer_call_fn_211928O01/�,
%�"
 �
inputs���������@
� "���������� �
B__inference_layer2_layer_call_and_return_conditional_losses_212035\BC/�,
%�"
 �
inputs��������� 
� "%�"
�
0���������
� z
'__inference_layer2_layer_call_fn_212012OBC/�,
%�"
 �
inputs��������� 
� "�����������
B__inference_layer3_layer_call_and_return_conditional_losses_212091\LM/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� z
'__inference_layer3_layer_call_fn_212068OLM/�,
%�"
 �
inputs���������
� "����������;
__inference_loss_fn_0_212135*�

� 
� "� ;
__inference_loss_fn_1_212146+�

� 
� "� ;
__inference_loss_fn_2_2121570�

� 
� "� ;
__inference_loss_fn_3_2121681�

� 
� "� ;
__inference_loss_fn_4_212179B�

� 
� "� ;
__inference_loss_fn_5_212190C�

� 
� "� ;
__inference_loss_fn_6_212201L�

� 
� "� ;
__inference_loss_fn_7_212212M�

� 
� "� �
C__inference_mf_item_layer_call_and_return_conditional_losses_211991]<=0�-
&�#
!�
inputs����������
� "%�"
�
0���������
� |
(__inference_mf_item_layer_call_fn_211980P<=0�-
&�#
!�
inputs����������
� "�����������
C__inference_mf_user_layer_call_and_return_conditional_losses_211971]670�-
&�#
!�
inputs����������
� "%�"
�
0���������
� |
(__inference_mf_user_layer_call_fn_211960P670�-
&�#
!�
inputs����������
� "�����������
D__inference_mlp_item_layer_call_and_return_conditional_losses_211850] !0�-
&�#
!�
inputs����������
� "%�"
�
0��������� 
� }
)__inference_mlp_item_layer_call_fn_211839P !0�-
&�#
!�
inputs����������
� "���������� �
D__inference_mlp_user_layer_call_and_return_conditional_losses_211830]0�-
&�#
!�
inputs����������
� "%�"
�
0��������� 
� }
)__inference_mlp_user_layer_call_fn_211819P0�-
&�#
!�
inputs����������
� "���������� �
A__inference_model_layer_call_and_return_conditional_losses_211248� !*+01BC67<=LMVWb�_
X�U
K�H
"�
input_1����������
"�
input_2����������
p 

 
� "%�"
�
0���������
� �
A__inference_model_layer_call_and_return_conditional_losses_211350� !*+01BC67<=LMVWb�_
X�U
K�H
"�
input_1����������
"�
input_2����������
p

 
� "%�"
�
0���������
� �
A__inference_model_layer_call_and_return_conditional_losses_211654� !*+01BC67<=LMVWd�a
Z�W
M�J
#� 
inputs/0����������
#� 
inputs/1����������
p 

 
� "%�"
�
0���������
� �
A__inference_model_layer_call_and_return_conditional_losses_211783� !*+01BC67<=LMVWd�a
Z�W
M�J
#� 
inputs/0����������
#� 
inputs/1����������
p

 
� "%�"
�
0���������
� �
&__inference_model_layer_call_fn_210784� !*+01BC67<=LMVWb�_
X�U
K�H
"�
input_1����������
"�
input_2����������
p 

 
� "�����������
&__inference_model_layer_call_fn_211146� !*+01BC67<=LMVWb�_
X�U
K�H
"�
input_1����������
"�
input_2����������
p

 
� "�����������
&__inference_model_layer_call_fn_211490� !*+01BC67<=LMVWd�a
Z�W
M�J
#� 
inputs/0����������
#� 
inputs/1����������
p 

 
� "�����������
&__inference_model_layer_call_fn_211532� !*+01BC67<=LMVWd�a
Z�W
M�J
#� 
inputs/0����������
#� 
inputs/1����������
p

 
� "�����������
D__inference_multiply_layer_call_and_return_conditional_losses_212047�Z�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "%�"
�
0���������
� �
)__inference_multiply_layer_call_fn_212041vZ�W
P�M
K�H
"�
inputs/0���������
"�
inputs/1���������
� "�����������
F__inference_prediction_layer_call_and_return_conditional_losses_212124\VW/�,
%�"
 �
inputs���������
� "%�"
�
0���������
� ~
+__inference_prediction_layer_call_fn_212113OVW/�,
%�"
 �
inputs���������
� "�����������
$__inference_signature_wrapper_211448� !*+01BC67<=LMVWk�h
� 
a�^
-
input_1"�
input_1����������
-
input_2"�
input_2����������"7�4
2

prediction$�!

prediction���������