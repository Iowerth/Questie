---@type Townsfolk
local Townsfolk = QuestieLoader:ImportModule("Townsfolk")

-- SELECT Entry FROM creature_template WHERE NpcFlags & 16 = 16 AND TrainerType=2
---@type NpcId[]
local professionTrainers

if Questie.IsWotlk then
    professionTrainers = {514,812,908,1103,1215,1218,1241,1292,1300,1317,1346,1355,1382,1385,1386,1430,1458,1470,1473,1632,1651,1676,1680,1681,1683,1699,1700,1701,1702,1703,2114,2132,2326,2327,2329,2367,2390,2391,2399,2627,2704,2798,2818,2834,2836,2837,2855,2856,2998,3001,3004,3007,3009,3011,3013,3026,3028,3067,3069,3087,3136,3137,3174,3175,3179,3181,3184,3185,3290,3332,3345,3347,3355,3357,3363,3365,3373,3399,3404,3478,3484,3494,3523,3549,3555,3557,3603,3604,3605,3606,3607,3703,3704,3964,3965,3967,4156,4159,4160,4193,4204,4210,4211,4212,4213,4254,4258,4552,4573,4576,4578,4588,4591,4596,4598,4611,4614,4616,4898,4900,5032,5037,5038,5040,5041,5127,5137,5150,5153,5157,5159,5161,5164,5174,5177,5392,5482,5493,5499,5502,5511,5513,5518,5564,5566,5690,5695,5759,5784,5938,5939,5941,5943,6094,6286,6287,6288,6289,6290,6291,6292,6295,6297,6299,6306,6387,7087,7088,7089,7230,7231,7232,7406,7866,7867,7868,7869,7870,7871,7944,7946,7948,7949,8126,8128,8144,8146,8153,8306,8736,8738,9584,10370,10993,11017,11025,11031,11037,11048,11050,11051,11052,11072,11073,11074,11097,11098,11146,11177,11178,11557,11865,11866,11867,11868,11869,11870,12025,12030,12032,12961,13084,14740,15400,15501,16000,16160,16161,16190,16253,16265,16272,16273,16277,16278,16366,16367,16583,16588,16621,16633,16639,16640,16642,16644,16662,16663,16667,16669,16676,16688,16692,16702,16719,16723,16724,16725,16726,16727,16728,16729,16731,16736,16744,16746,16752,16763,16773,16774,16780,16823,17005,17101,17214,17215,17222,17245,17246,17424,17434,17441,17442,17487,17488,17634,17637,17983,18018,18747,18748,18749,18751,18752,18753,18754,18755,18771,18772,18773,18774,18775,18776,18777,18779,18802,18804,18911,18987,18988,18990,18991,18993,19052,19063,19180,19184,19185,19186,19187,19251,19252,19341,19369,19478,19539,19540,19576,19774,19775,19777,19778,20124,20125,21087,22477,23734,24868,25099,25277,26564,26903,26904,26905,26906,26907,26909,26910,26911,26912,26913,26914,26915,26916,26951,26952,26953,26954,26955,26956,26957,26958,26959,26960,26961,26962,26963,26964,26969,26972,26974,26975,26976,26977,26980,26981,26982,26986,26987,26988,26989,26990,26991,26992,26993,26994,26995,26996,26997,26998,26999,27000,27001,27023,27029,27034,28693,28694,28696,28697,28698,28699,28700,28701,28702,28703,28704,28705,28706,28742,29233,29505,29506,29507,29508,29509,29513,29514,29631,29924,30706,30709,30710,30711,30713,30715,30716,30717,30721,30722,32474,33580,33581,33583,33586,33587,33588,33589,33590,33591,33603,33630,33631,33633,33634,33635,33636,33637,33638,33640,33641,33674,33675,33676,33677,33678,33679,33680,33681,33682,33683,33684,33996}
elseif Questie.IsTBC then
    professionTrainers = {
        514,812,908,1103,1215,1218,1241,1292,1300,1317,1346,1355,1382,1385,1386,1430,1458,1470,1473,1632,1651,1676,1680,1681,1683,
        1699,1700,1701,1702,1703,2114,2132,2326,2327,2329,2367,2390,2391,2399,2627,2704,2798,2818,2834,2836,2837,2855,2856,2998,3001,
        3004,3007,3009,3011,3013,3026,3028,3067,3069,3087,3136,3137,3174,3175,3179,3181,3184,3185,3290,3332,3345,3347,3355,3357,3363,
        3365,3373,3399,3404,3478,3484,3494,3523,3549,3555,3557,3603,3604,3605,3606,3607,3703,3704,3964,3965,3967,4156,4159,4160,4193,
        4204,4210,4211,4212,4213,4254,4258,4552,4573,4576,4578,4588,4591,4596,4598,4611,4614,4616,4898,4900,5127,5137,5150,5153,5157,
        5159,5161,5164,5174,5177,5392,5482,5493,5499,5502,5511,5513,5518,5564,5566,5690,5695,5759,5784,5938,5939,5941,5943,6094,6286,
        6287,6288,6289,6290,6291,6292,6295,6297,6299,6306,6387,7087,7088,7089,7230,7231,7232,7406,7866,7867,7868,7869,7870,7871,7944,
        7946,7948,7949,8126,8128,8144,8146,8153,8306,8736,8738,9584,10370,10993,11017,11025,11031,11037,11048,11050,11051,11052,11072,
        11073,11074,11097,11098,11146,11177,11178,11865,11866,11867,11868,11869,11870,12025,12030,12032,12920,12939,12961,13084,14401,14740,15400,
        15501,16160,16161,16253,16272,16273,16277,16278,16366,16367,16583,16588,16621,16633,16639,16640,16642,16644,16662,16663,16667,
        16669,16676,16688,16692,16702,16719,16723,16724,16725,16726,16727,16728,16729,16731,16736,16744,16746,16752,16763,16773,16774,
        16780,16823,17005,17101,17214,17215,17222,17245,17246,17424,17434,17441,17442,17487,17488,17634,17637,17983,18018,18747,18748,
        18749,18751,18752,18753,18754,18755,18771,18772,18773,18774,18775,18776,18777,18779,18802,18804,18987,18988,18990,18991,18993,
        19052,19063,19180,19184,19185,19186,19187,19251,19252,19341,19369,19478,19539,19540,19576,19774,19775,19777,19778,20124,20125,
        21087,22477,24868,25099
    }
else
    professionTrainers = {
        223,514,812,908,957,1103,1215,1218,1241,1246,1292,1300,1317,1346,1355,1382,1383,1385,1386,1430,1458,1466,1470,1473,1632,1651,
        1676,1680,1681,1683,1699,1700,1701,1702,1703,2114,2132,2326,2327,2329,2367,2390,2391,2399,2627,2704,2737,2798,2818,2834,2836,
        2837,2855,2856,2857,2998,3001,3004,3007,3008,3009,3011,3013,3026,3028,3067,3069,3087,3136,3137,3174,3175,3179,3181,3184,3185,
        3290,3332,3345,3347,3355,3357,3363,3365,3373,3399,3404,3412,3478,3484,3494,3523,3530,3531,3549,3555,3557,3603,3604,3605,3606,
        3607,3703,3704,3964,3965,3967,4156,4159,4160,4193,4204,4210,4211,4212,4213,4254,4258,4552,4573,4576,4578,4586,4588,4591,4596,
        4598,4605,4609,4611,4614,4616,4898,4900,5127,5137,5150,5153,5157,5159,5161,5164,5174,5177,5392,5482,5493,5499,5500,5502,5511,
        5513,5518,5564,5566,5567,5690,5695,5759,5784,5811,5938,5939,5941,5943,6094,6286,6287,6288,6289,6290,6291,6292,6295,6297,6299,
        6306,6387,7087,7088,7089,7230,7231,7232,7406,7866,7867,7868,7869,7870,7871,7944,7946,7948,7949,8126,8128,8144,8146,8153,8306,
        8736,8738,9584,10266,10276,10277,10278,10993,11017,11025,11026,11028,11029,11031,11037,11041,11042,11044,11046,11047,11048,
        11049,11050,11051,11052,11065,11066,11067,11068,11070,11071,11072,11073,11074,11081,11083,11084,11096,11097,11098,11146,
        11177,11178,11865,11866,11867,11868,11869,11870,12025,12030,12032,12920,12939,12961,13084,14401,14740
    }
end

function Townsfolk.GetProfessionTrainers()
    return professionTrainers
end
