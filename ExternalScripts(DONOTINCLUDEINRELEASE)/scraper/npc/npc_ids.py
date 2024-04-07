# https://www.wowhead.com/classic/npcs?filter=13;2;11502
# r = []
# document.getElementsByClassName("listview-cleartext").forEach(l => r.push(parseInt(l.href.substr(36, 6)))); r; // run for each page
# [...new Set(r)].sort();
NPC_IDS = [
    162539,
    169106,
    173338,
    176552,
    176553,
    176663,
    176721,
    177063,
    183709,
    183713,
    184314,
    184383,
    185273,
    185320,
    185331,
    185332,
    185336,
    185342,
    185371,
    185378,
    185379,
    185380,
    185536,
    185585,
    185590,
    185605,
    185631,
    185650,
    185658,
    185746,
    185760,
    185859,
    185868,
    186130,
    186348,
    186506,
    187162,
    187237,
    187274,
    187309,
    187327,
    187345,
    187346,
    187383,
    187564,
    187664,
    187724,
    187725,
    187728,
    187729,
    187798,
    187801,
    187832,
    187978,
    187993,
    188018,
    188109,
    188110,
    188111,
    188119,
    188131,
    188134,
    188147,
    188148,
    188170,
    188178,
    188182,
    188183,
    189047,
    200571,
    201722,
    201854,
    201933,
    202060,
    202079,
    202093,
    202116,
    202387,
    202390,
    202391,
    202392,
    202699,
    202838,
    202839,
    202840,
    203079,
    203138,
    203139,
    203147,
    203218,
    203226,
    203279,
    203475,
    203478,
    203694,
    204068,
    204070,
    204091,
    204253,
    204256,
    204346,
    204503,
    204545,
    204645,
    204675,
    204758,
    204827,
    204921,
    204937,
    204940,
    204960,
    204961,
    204962,
    204989,
    205153,
    205278,
    205382,
    205383,
    205422,
    205423,
    205635,
    205692,
    205700,
    205724,
    205729,
    205733,
    205765,
    205767,
    205805,
    206152,
    206153,
    206154,
    206155,
    206217,
    206245,
    206248,
    207010,
    207356,
    207358,
    207359,
    207367,
    207397,
    207457,
    207515,
    207520,
    207527,
    207576,
    207577,
    207588,
    207637,
    207743,
    207754,
    207957,
    208023,
    208036,
    208071,
    208124,
    208127,
    208128,
    208158,
    208179,
    208180,
    208184,
    208196,
    208226,
    208275,
    208307,
    208309,
    208518,
    208546,
    208565,
    208619,
    208638,
    208652,
    208682,
    208711,
    208712,
    208752,
    208758,
    208802,
    208809,
    208810,
    208811,
    208812,
    208841,
    208842,
    208843,
    208844,
    208845,
    208846,
    208847,
    208875,
    208876,
    208886,
    208919,
    208920,
    208927,
    208974,
    208975,
    209002,
    209004,
    209209,
    209213,
    209214,
    209511,
    209524,
    209548,
    209607,
    209608,
    209678,
    209742,
    209758,
    209773,
    209797,
    209806,
    209811,
    209812,
    209815,
    209830,
    209872,
    209889,
    209908,
    209928,
    209939,
    209940,
    209941,
    209948,
    209949,
    209954,
    209958,
    210006,
    210107,
    210451,
    210482,
    210483,
    210487,
    210501,
    210528,
    210533,
    210537,
    210549,
    210697,
    210750,
    210802,
    210845,
    210887,
    210901,
    210995,
    211022,
    211033,
    211042,
    211043,
    211146,
    211183,
    211188,
    211200,
    211225,
    211229,
    211269,
    211274,
    211279,
    211298,
    211330,
    211338,
    211552,
    211653,
    211736,
    211764,
    211765,
    211839,
    211875,
    211941,
    211951,
    211952,
    211953,
    211954,
    211955,
    211956,
    211965,
    211967,
    212159,
    212186,
    212209,
    212252,
    212261,
    212330,
    212333,
    212334,
    212443,
    212458,
    212461,
    212462,
    212463,
    212468,
    212598,
    212667,
    212674,
    212678,
    212692,
    212694,
    212699,
    212703,
    212706,
    212707,
    212727,
    212728,
    212729,
    212730,
    212753,
    212763,
    212801,
    212802,
    212803,
    212804,
    212809,
    212837,
    212934,
    212953,
    212969,
    212970,
    213077,
    213334,
    213444,
    213445,
    213450,
    213451,
    213452,
    213540,
    213595,
    213659,
    213708,
    213709,
    213710,
    213711,
    213795,
    213994,
    214000,
    214063,
    214070,
    214096,
    214098,
    214099,
    214101,
    214129,
    214133,
    214190,
    214208,
    214212,
    214254,
    214440,
    214456,
    214458,
    214468,
    214469,
    214519,
    214523,
    214524,
    214525,
    214526,
    214527,
    214528,
    214529,
    214530,
    214589,
    214603,
    214612,
    214658,
    214695,
    214830,
    214837,
    214876,
    214914,
    214954,
    215062,
    215068,
    215072,
    215081,
    215095,
    215096,
    215097,
    215098,
    215108,
    215367,
    215369,
    215643,
    215655,
    215688,
    215709,
    215728,
    215849,
    215850,
    215854,
    215855,
    215890,
    215974,
    216098,
    216126,
    216145,
    216289,
    216310,
    216437,
    216445,
    216448,
    216451,
    216463,
    216474,
    216620,
    216659,
    216660,
    216661,
    216662,
    216664,
    216665,
    216666,
    216667,
    216668,
    216669,
    216670,
    216671,
    216672,
    216810,
    216854,
    216902,
    216915,
    216924,
    216931,
    216937,
    217049,
    217215,
    217216,
    217221,
    217280,
    217290,
    217300,
    217302,
    217305,
    217308,
    217387,
    217392,
    217412,
    217418,
    217580,
    217582,
    217588,
    217589,
    217590,
    217605,
    217620,
    217669,
    217683,
    217689,
    217703,
    217706,
    217707,
    217711,
    217733,
    217783,
    217836,
    217862,
    217907,
    217908,
    217942,
    217943,
    217945,
    217956,
    217957,
    217969,
    217980,
    217987,
    217996,
    218007,
    218019,
    218020,
    218021,
    218029,
    218032,
    218057,
    218089,
    218090,
    218093,
    218095,
    218115,
    218160,
    218229,
    218230,
    218231,
    218232,
    218233,
    218234,
    218235,
    218236,
    218237,
    218238,
    218240,
    218241,
    218242,
    218243,
    218244,
    218245,
    218246,
    218249,
    218262,
    218263,
    218273,
    218343,
    218344,
    218345,
    218349,
    218386,
    218434,
    218460,
    218461,
    218462,
    218537,
    218538,
    218571,
    218606,
    218610,
    218624,
    218627,
    218683,
    218690,
    218706,
    218718,
    218721,
    218776,
    218792,
    218813,
    218819,
    218868,
    218869,
    218870,
    218871,
    218873,
    218891,
    218908,
    218920,
    218922,
    218930,
    218931,
    218935,
    218969,
    218970,
    218971,
    218972,
    218973,
    218974,
    218975,
    219110,
    219111,
    219112,
    219113,
    219177,
    219199,
    219624,
    219659,
    219663,
    219704,
    219762,
    219791,
    219822,
    219986,
    219999,
    220007,
    220064,
    220072,
    220075,
    220076,
    220077,
    220142,
    220170,
    220174,
    220178,
    220179,
    220358,
    220396,
    220833,
    220864,
    220908,
    220929,
    220930,
    220931,
    220932,
    220933,
    220934,
    220935,
    220936,
    220937,
    220942,
    220984,
    221165,
    221168,
    221169,
    221170,
    221171,
    221172,
    221173,
    221174,
    221175,
    221176,
    221200,
    221201,
    221204,
    221206,
    221207,
    221208,
    221210,
    221215,
    221216,
    221220,
    221221,
    221222,
    221223,
    221226,
    221227,
    221230,
    221257,
    221258,
    221259,
    221260,
    221261,
    221262,
    221263,
    221264,
    221265,
    221266,
    221267,
    221268,
    221269,
    221270,
    221271,
    221272,
    221273,
    221282,
    221283,
    221292,
    221312,
    221315,
    221324,
    221325,
    221326,
    221328,
    221329,
    221330,
    221331,
    221333,
    221334,
    221335,
    221336,
    221337,
    221351,
    221352,
    221353,
    221356,
    221357,
    221360,
    221361,
    221364,
    221365,
    221367,
    221369,
    221370,
    221371,
    221373,
    221375,
    221377,
    221389,
    221391,
    221393,
    221394,
    221395,
    221396,
    221398,
    221399,
    221400,
    221401,
    221402,
    221404,
    221406,
    221407,
    221408,
    221426,
    221471,
    221472,
    221477,
    221479,
    221480,
    221482,
    221483,
    221484,
    221493,
    221575,
    221587,
    221631,
    221636,
    221637,
    221638,
    221639,
    221640,
    221651,
    221656,
    221658,
    221732,
    221740,
    221759,
    221761,
    221762,
    221827,
    221828,
    221829,
    221830,
    221831,
    221832,
    221833,
    221834,
    221835,
    221836,
    221837,
    221838,
    221916,
    221924,
    221928,
    221933,
    221935,
    221942,
    221943,
    221981,
    221985,
    222004,
    222005,
    222008,
    222044,
    222052,
    222058,
    222088,
    222089,
    222174,
    222188,
    222192,
    222198,
    222210,
    222225,
    222228,
    222232,
    222233,
    222243,
    222244,
    222249,
    222250,
    222251,
    222252,
    222253,
    222254,
    222256,
    222257,
    222261,
    222269,
    222286,
    222288,
    222289,
    222290,
    222293,
    222316,
    222367,
    222376,
    222402,
    222403,
    222404,
    222405,
    222406,
    222407,
    222408,
    222409,
    222410,
    222411,
    222412,
    222413,
    222414,
    222415,
    222416,
    222418,
    222444,
    222451,
    222478,
    222495,
    222513,
    222514,
    222516,
    222519,
    222521,
    222522,
    222523,
    222525,
    222530,
    222531,
    222542,
    222543,
    222544,
    222545,
    222546,
    222551,
    222553,
    222566,
    222573,
    222580,
    222617,
    222620,
    222623,
    222625,
    222636,
    222647,
    222648,
    222649,
    222650,
    222651,
    222656,
    222684,
    222685,
    222686,
    222687,
    222689,
    222694,
    222695,
    222696,
    222697,
    222698,
    222699,
    222701,
    222702,
    222703,
    222704,
    222705,
    222706,
    222707,
    222708,
    222709,
    222710,
    222726,
    222734,
    222763,
    222765,
    222768,
    222772,
    222789,
    222799,
    222856,
    222857,
    222897,
    222919,
    222939,
    222968,
    222970,
    222971,
    222972,
    222977,
    222978,
    223061,
    223068,
    223123,
    223127,
    223128,
    223130,
    223131,
    223212,
    223264,
    223265,
    223287,
    223340,
    223345,
    223359,
    223374,
    223413,
    223482,
    223483,
    223485,
    223496,
    223542,
    223543,
    223544,
    223568,
    223581,
    223586,
    223587,
    223588,
    223590,
    223591,
    223689,
    223720,
    223734,
    223737,
    224242,
    224243,
    224244,
    224245,
    224250,
    224253,
    224254,
    224255,
    224256,
    224257,
    224258,
    224259,
    224260,
    224262,
    224263,
    224328,
]
