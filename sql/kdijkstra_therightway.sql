﻿create table raw_base as
SELECT seq, id1 AS path, id2 AS node, id3 AS edge, cost, b.geom, b.source, st_length(b.geom)
		FROM pgr_kdijkstraPath(
			'SELECT id, source, target, base::double precision as cost 
			 FROM pbn', 839, array[
			 3,4,11,12,15,16,17,18,21,22,23,24,25,26,27,29,30,31,32,33,34,35,37,38,39,40,41,42,43,44,46,47,48,49,50,51,52,54,55,56,57,58,59,60,62,64,65,66,68,69,70,72,73,74,75,76,77,79,80,81,82,83,86,87,88,90,92,93,94,95,96,97,100,102,103,104,106,107,108,110,112,114,115,116,118,120,123,125,126,127,128,130,131,132,133,134,136,138,140,144,145,146,148,149,150,151,152,153,154,155,157,159,160,161,162,163,164,165,167,169,171,172,173,174,175,176,177,179,180,181,183,185,186,187,188,189,190,191,192,193,195,196,197,198,199,201,203,205,207,209,211,213,215,217,218,219,220,222,223,224,226,227,228,229,231,233,234,236,238,239,240,242,243,246,248,249,250,252,254,256,257,258,260,262,263,264,265,268,269,270,271,272,273,274,275,276,277,278,279,280,282,283,284,286,287,288,289,290,291,292,294,295,296,298,299,300,301,302,303,304,305,308,311,312,313,314,315,316,317,318,319,320,321,323,324,326,328,330,331,333,334,335,336,337,338,339,340,341,342,343,344,345,347,348,349,353,355,356,357,359,360,362,363,364,366,367,368,370,371,375,376,377,378,379,380,381,382,384,385,386,390,392,393,394,395,396,401,402,403,404,405,406,407,408,409,410,412,413,414,415,416,417,419,420,421,422,423,425,426,427,429,435,438,439,440,441,442,444,446,447,448,449,450,451,453,454,455,456,457,458,459,460,461,463,466,467,468,469,470,472,473,474,475,479,480,482,483,485,487,488,490,491,492,493,494,495,497,499,500,501,503,505,506,507,510,512,513,514,516,518,519,520,521,529,530,531,532,533,535,536,537,538,539,540,553,555,559,562,568,570,571,575,580,581,584,589,590,593,595,597,599,601,603,611,624,645,666,669,670,671,672,673,674,676,686,692,693,694,696,698,699,700,701,702,703,704,705,706,708,709,715,717,722,723,724,725,727,728,729,731,732,734,735,736,737,738,739,740,741,742,743,750,751,752,754,756,757,759,760,761,766,773,776,777,779,780,781,782,783,785,786,787,788,789,790,791,792,793,794,798,799,802,803,805,806,807,810,811,812,813,814,815,817,818,819,820,821,822,823,824,825,826,827,828,829,830,831,832,833,834,835,836,838,839,841,842,843,844,846,847,848,849,850,851,852,853,854,855,856,857,858,859,860,861,862,863,864,866,868,869,870,871,872,873,874,875,876,877,878,879,880,881,882,883,884,885,886,888,889,890,891,893,894,895,896,897,899,900,901,902,903,905,906,908,909,910,911,913,914,915,916,917,918,919,920,921,923,924,925,926,927,928,929,930,931,933,934,935,936,937,938,939,940,941,943,945,946,948,949,950,952,968,970,971,980,983,984,985,986,987,988,989,991,992,993,994,995,1002,1003,1004,1006,1007,1008,1009,1011,1013,1015,1016,1018,1019,1020,1021,1025,1027,1029,1033,1034,1037,1038,1039,1041,1044,1045,1046,1057,1064,1066,1067,1068,1069,1070,1071,1073,1074,1075,1076,1077,1078,1079,1080,1081,1083,1084,1085,1086,1087,1088,1089,1090,1091,1092,1093,1094,1095,1096,1097,1098,1099,1100,1101,1103,1104,1105,1106,1107,1109,1110,1111,1112,1113,1115,1117,1118,1119,1120,1121,1122,1124,1125,1126,1128,1129,1131,1133,1134,1135,1137,1138,1139,1141,1142,1143,1144,1145,1146,1148,1149,1151,1153,1155,1156,1157,1158,1159,1160,1161,1162,1163,1164,1165,1166,1167,1168,1169,1170,1171,1173,1174,1175,1176,1177,1179,1180,1181,1183,1184,1185,1186,1189,1190,1191,1193,1194,1195,1196,1197,1198,1199,1200,1202,1204,1206,1207,1209,1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1238,1239,1242,1244,1245,1246,1247,1248,1249,1250,1251,1252,1253,1254,1255,1256,1258,1260,1261,1262,1263,1264,1265,1266,1267,1268,1269,1270,1271,1272,1273,1274,1275,1276,1277,1278,1279,1281,1282,1283,1284,1285,1286,1287,1288,1289,1290,1291,1292,1293,1294,1295,1296,1297,1298,1300,1301,1302,1303,1304,1305,1306,1307,1308,1309,1310,1311,1312,1313,1314,1315,1316,1317,1319,1320,1321,1322,1323,1324,1325,1328,1329,1330,1331,1332,1333,1336,1337,1338,1340,1341,1342,1343,1344,1345,1346,1347,1348,1349,1350,1351,1352,1353,1354,1355,1356,1358,1359,1360,1361,1362,1363,1364,1366,1367,1369,1371,1372,1373,1374,1376,1377,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1390,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400,1401,1402,1403,1404,1406,1407,1411,1412,1414,1415,1416,1417,1418,1420,1422,1423,1424,1426,1428,1430,1432,1434,1435,1436,1437,1438,1439,1440,1442,1444,1447,1448,1449,1451,1453,1455,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1473,1474,1475,1476,1477,1479,1480,1481,1482,1483,1485,1486,1487,1488,1489,1490,1491,1492,1493,1495,1496,1497,1498,1500,1501,1502,1503,1505,1506,1508,1509,1510,1511,1513,1514,1515,1516,1518,1519,1520,1521,1522,1523,1524,1525,1527,1528,1529,1532,1533,1535,1536,1537,1538,1539,1540,1542,1544,1546,1547,1549,1550,1551,1553,1555,1556,1557,1558,1559,1560,1561,1562,1563,1564,1567,1568,1569,1570,1571,1572,1573,1577,1579,1580,1581,1582,1583,1585,1586,1587,1589,1590,1591,1592,1593,1594,1595,1596,1598,1600,1601,1603,1604,1605,1606,1610,1611,1612,1613,1614,1615,1617,1618,1619,1620,1621,1623,1624,1625,1626,1628,1629,1631,1632,1633,1635,1636,1637,1638,1639,1641,1642,1643,1645,1646,1647,1648,1649,1650,1651,1652,1653,1655,1656,1657,1658,1659,1660,1661,1662,1663,1665,1666,1667,1668,1669,1670,1671,1674,1675,1676,1677,1679,1680,1681,1682,1684,1685,1686,1688,1689,1690,1692,1693,1694,1695,1696,1697,1698,1699,1700,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1715,1716,1717,1719,1721,1722,1724,1725,1726,1728,1729,1730,1732,1736,1737,1738,1739,1741,1742,1743,1745,1747,1749,1751,1752,1753,1754,1757,1759,1761,1762,1763,1764,1765,1766,1768,1774,1777,1779,1780,1781,1782,1784,1785,1787,1788,1789,1790,1791,1792,1793,1794,1795,1796,1797,1798,1799,1801,1802,1803,1804,1806,1808,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1820,1821,1823,1825,1826,1827,1828,1829,1830,1832,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1848,1849,1850,1852,1854,1855,1856,1857,1858,1859,1861,1862,1864,1865,1866,1867,1869,1870,1871,1872,1873,1875,1876,1877,1879,1880,1882,1883,1884,1886,1887,1888,1889,1890,1891,1892,1893,1894,1895,1898,1899,1900,1901,1902,1903,1904,1906,1907,1908,1910,1913,1914,1915,1919,1920,1922,1924,1925,1926,1928,1929,1931,1932,1934,1935,1937,1938,1941,1942,1943,1944,1945,1946,1948,1950,1951,1952,1954,1957,1958,1959,1960,1962,1963,1965,1968,1969,1974,1976,1977,1979,1981,1983,1984,1986,1987,1988,1989,1990,1991,1992,1994,1995,1997,2000,2001,2003,2004,2005,2006,2008,2009,2010,2012,2013,2015,2016,2017,2018,2020,2021,2023,2025,2027,2029,2032,2033,2035,2037,2038,2039,2041,2043,2045,2047,2048,2049,2051,2053,2054,2056,2057,2061,2062,2064,2065,2066,2067,2068,2069,2072,2073,2074,2075,2076,2077,2078,2080,2081,2082,2083,2084,2086,2088,2089,2090,2093,2101,2103,2104,2105,2106,2107,2108,2109,2110,2112,2113,2114,2116,2120,2123,2124,2126,2129,2130,2132,2133,2135,2136,2137,2138,2140,2141,2142,2143,2144,2145,2146,2147,2148,2151,2153,2154,2156,2157,2158,2159,2164,2165,2166,2167,2168,2169,2171,2173,2178,2179,2180,2181,2183,2188,2191,2193,2194,2196,2197,2199,2200,2202,2203,2205,2207,2209,2210,2212,2213,2214,2215,2216,2217,2218,2219,2222,2223,2224,2225,2227,2228,2229,2231,2232,2233,2235,2236,2237,2238,2240,2242,2243,2244,2245,2247,2251,2254,2256,2258,2260,2262,2264,2265,2266,2267,2269,2270,2271,2272,2275,2276,2278,2279,2281,2283,2285,2287,2288,2290,2292,2293,2298,2299,2301,2302,2303,2305,2306,2307,2308,2310,2311,2312,2314,2315,2316,2317,2321,2323,2327,2328,2329,2332,2334,2335,2336,2342,2343,2344,2345,2346,2347,2348,2349,2354,2355,2357,2358,2360,2362,2364,2367,2370,2372,2375,2377,2379,2380,2381,2383,2385,2386,2388,2390,2393,2395,2397,2398,2399,2400,2402,2405,2406,2408,2412,2413,2416,2417,2418,2419,2421,2422,2423,2425,2426,2430,2432,2433,2434,2436,2446,2447,2448,2451,2452,2454,2455,2456,2459,2460,2462,2463,2464,2466,2470,2471,2473,2475,2477,2479,2482,2484,2485,2488,2490,2492,2493,2494,2496,2497,2498,2500,2501,2502,2504,2505,2507,2508,2509,2510,2513,2514,2515,2517,2518,2519,2520,2523,2525,2526,2527,2528,2529,2530,2533,2535,2539,2540,2541,2542,2543,2545,2546,2547,2548,2549,2550,2551,2553,2555,2557,2558,2559,2560,2561,2562,2563,2564,2565,2566,2567,2569,2570,2571,2573,2574,2577,2579,2580,2581,2584,2586,2587,2588,2590,2591,2592,2593,2595,2596,2600,2601,2602,2603,2604,2605,2606,2607,2609,2610,2611,2615,2616,2618,2621,2622,2624,2625,2628,2629,2631,2632,2634,2635,2637,2638,2641,2643,2644,2646,2647,2648,2649,2650,2653,2655,2656,2659,2661,2662,2664,2667,2668,2669,2670,2673,2675,2676,2681,2683,2684,2686,2689,2690,2691,2692,2693,2697,2700,2701,2702,2704,2706,2708,2710,2711,2712,2713,2715,2716,2717,2718,2720,2721,2722,2725,2726,2727,2728,2729,2730,2732,2735,2736,2737,2740,2741,2743,2744,2745,2746,2747,2748,2754,2755,2758,2760,2762,2764,2768,2771,2772,2773,2775,2778,2780,2781,2782,2784,2785,2786,2787,2788,2789,2791,2792,2793,2795,2797,2798,2799,2800,2801,2802,2803,2804,2805,2806,2807,2808,2809,2811,2812,2814,2815,2816,2817,2818,2819,2820,2822,2823,2824,2825,2826,2827,2828,2829,2831,2833,2835,2836,2838,2839,2842,2843,2844,2845,2846,2850,2851,2853,2854,2856,2857,2858,2860,2861,2863,2866,2867,2868,2869,2871,2872,2873,2874,2875,2878,2879,2882,2883,2885,2886,2887,2890,2892,2893,2894,2895,2897,2899,2900,2901,2902,2904,2905,2907,2908,2909,2912,2914,2915,2917,2919,2921,2923,2925,2927,2929,2933,2935,2937,2938,2940,2941,2942,2944,2946,2947,2948,2950,2951,2952,2953,2958,2959,2961,2962,2964,2965,2967,2969,2971,2974,2975,2978,2980,2981,2983,2984,2997,3000,3001,3004,3005,3006,3008,3009,3012,3015,3021,3023,3024,3026,3030,3032,3035,3037,3038,3039,3041,3045,3047,3050,3051,3052,3057,3061,3063,3064,3065,3067,3073,3074,3075,3076,3077,3078,3080,3081,3084,3085,3088,3090,3091,3092,3093,3094,3095,3098,3100,3101,3105,3107,3109,3110,3111,3114,3115,3116,3118,3120,3121,3124,3125,3127,3128,3129,3131,3133,3135,3136,3139,3149,3150,3151,3153,3154,3158,3160,3162,3169,3176,3177,3178,3179,3181,3183,3184,3187,3203,3206,3207,3209,3211,3216,3218,3223,3225,3226,3230,3240,3248,3264,3266,3268,3273,3275,3278,3285,3287,3289,3290,3294,3296,3297,3298,3300,3305,3308,3321,3376,3390,3394,3396,3400,3419,3421,3423,3425,3427,3429,3432,3433,3434,3437,3442,3447,3449,3450,3451,3454,3457,3459,3460,3462,3463,3475,3479,3523,3529,3544,3548,3549,3550,3551,3552,3554,3563,3571,3578,3584,3587,3588,3589,3591,3592,3593,3594,3597,3598,3610,3623,3775,3798,3803,3805,3889,3934,4274,4322,4327,4330,4331,4333,4334,4335,4339,4347,4349,4351,4353,4355,4356,4357,4358,4361,4362,4363,4364,4365,4366,4375,4377,4392,3071,3480,3484,3486,574,3496,3498,3306,3509,3309,3513,3901,3532,564,3535,566,3536,982,3408,3558,3560,19,3566,587,3568,3569,3573,3902,3574,3575,3576,3581,3596,3599,85,549,84,3461,3288,285,3564,3920,3814,3602,3607,4200,3608,1026,3621,3624,3829,3430,3626,541,656,710,687,712,3562,2956,561,633,772,543,545,546,547,557,558,3917,3631,3801,3628,1541,3630,3632,3634,3636,3638,3640,3642,795,608,610,612,3644,3646,3648,3651,639,4299,3228,605,3205,306,662,3655,3656,3658,796,3661,840,3664,4372,3667,3669,3671,3673,3913,3878,3471,3250,3488,3675,3677,3678,3489,354,620,619,621,3683,648,3316,3687,3688,2738,3695,3697,679,3703,4396,4397,4398,3846,3705,3707,577,3365,3282,524,526,576,527,3690,3691,3693,3371,3130,3284,3310,3712,4399,3919,3713,3715,3716,3718,3580,3719,3721,3689,464,3724,3725,3726,582,3700,3729,3730,424,3731,3481,954,3941,3466,3734,3736,3737,3738,3740,3742,3744,3745,3747,2977,67,4401,4514,4402,3761,3755,3435,3866,4404,4406,2046,4407,3749,3751,3752,3614,3753,3355,2163,622,623,625,598,71,3757,3758,2986,2849,3743,3765,3766,89,3768,1602,4389,3769,3770,3609,3485,3772,3773,3880,3881,3189,3999,3754,4409,3756,117,4287,4019,3978,3428,3776,3017,3018,3611,3778,3780,627,3782,3784,3785,585,668,3790,3791,3793,800,3643,3795,629,3301,3893,3797,556,3895,3794,3806,3812,616,3682,3668,525,3808,4479,618,3810,170,713,3815,3817,3665,638,3483,3819,3820,3629,3916,3822,3824,3842,3694,617,643,3809,4413,4309,4170,3684,647,3843,3341,3845,3847,3849,3947,3839,614,651,3851,683,3837,3856,655,711,677,3653,2277,661,3657,3662,4484,3708,4126,3867,3654,3858,3650,3869,3870,3872,3875,3877,3467,3811,3884,3645,3876,3299,3311,3907,3727,3899,3900,682,630,3906,14,3909,3910,3912,3918,3924,3706,4044,3926,3929,3930,3931,3927,695,3933,3622,3935,3936,3676,951,718,3948,3659,3937,3954,1767,3957,719,542,3958,3302,2750,2696,3960,3962,4251,953,3965,955,3559,3970,3303,2403,3981,626,3983,3966,3774,3590,3827,3874,4394,663,3412,3984,3985,1504,3986,3987,3991,361,3994,332,3996,3997,801,3998,4000,957,631,389,657,4004,4007,3567,4010,4013,4014,3952,4016,4017,4018,2182,4020,4021,411,3925,4022,230,3714,4025,3746,3034,956,484,3964,3612,3961,4029,4031,4416,372,3663,1427,3838,1005,1565,4034,4035,4036,1357,445,4039,962,481,1687,816,3833,3944,3796,4045,3940,4049,3896,4050,744,745,4051,4306,1452,4053,4054,4055,3647,4056,4058,4060,4062,3887,2221,4065,3974,3871,746,748,4068,4070,4071,4072,4074,4075,4076,3229,659,960,3186,3860,3859,4284,4077,3291,4079,4081,4082,3577,4084,4314,4085,2939,973,3231,4087,4424,3990,4089,4094,4095,4097,4100,4425,3286,4104,678,975,977,680,4083,1335,4109,1334,4110,4112,4115,4116,3340,2512,979,2481,4429,4120,4122,3517,637,3967,4125,3868,3317,3322,4127,4342,4344,4132,922,3326,3324,4130,4105,4133,4092,4099,4117,1723,4118,4426,4428,3915,588,3453,3897,4481,808,4135,1028,4136,4138,4140,4141,3911,4144,4147,4305,4149,3364,3315,981,4153,3619,689,4155,4157,4158,691,3280,3194,4160,4161,4172,4174,4175,4176,4178,999,1831,771,770,4185,3137,4187,4189,4190,1001,4192,3861,3862,4194,591,4042,4202,996,997,3989,434,3312,431,433,3381,522,3885,3582,3722,3613,3923,4414,649,3787,4168,4195,4197,1030,119,4204,4206,2424,2703,762,4210,4212,4432,432,1654,232,4218,4219,2092,764,3213,4225,4198,4227,4229,650,2034,4232,4220,4234,4043,4237,4239,4241,4243,4207,4246,4247,4208,990,4222,1517,1457,4181,1939,4435,4436,2031,4250,3313,4254,4256,4258,4164,4262,4182,4263,4264,4166,4267,998,4270,2071,4271,1947,4224,2774,4273,768,4131,4275,4438,4277,721,4278,1000,4191,4167,4280,2234,767,1897,4281,3443,2636,3980,4286,4439,961,4292,4505,2960,4293,4417,4159,4294,3413,4297,4078,1720,4023,2152,486,4301,2987,4303,3279,3555,1805,4037,4308,1023,4154,4310,3182,1024,4315,4316,4312,4319,4371,809,1031,4386,3455,4509,3099,4440,4442,1036,4102,4302,4443,7,8,3122,3165,1035,4444,3174,3314,3516,3383,3384,1042,3386,567,1072,4151,4455,3171,3173,3214,3343,3539,3834,3863,3939,3946,3951,4421,4512,2117,3903,3318,4123,3320,4381,3541,583,976,3603,3891,3888,3908,4448,4093,4450,3699,1047,1048,4106,4454,681,3836,640,2651,4513,4345,3680,2865,1052,4460,1051,4462,4464,3701,4466,3892,3164,4468,4469,3841,3928,1718,749,3973,4507,4064,4145,4108,4475,1102,3864,4307,4080,2796,636,730,3604,178,4524,2884,4517,3418,4485,3494,3360,3328,1049,758,755,775,4066,3358,534,4458,3618,502,2096,3975,3976,4283,4489,4490,707,4473,3236,4474,1059,2384,397,1152,3325,1017,3692,398,3886,753,1953,13,685,3519,3531,156,400,3097,3082,1063,1772,642,4519,1607,4063,9,2175,4482,310,373,508,964,966,1240,202,1409,1445,4332,1575,1576,1241,98,1975,1734,1735,2428,2472,596,2678,3855,244,2695,2714,266,2848,2880,2516,2055,3156,2989,2990,3123,3113,2751,351,3219,3220,4376,3292,3159,3167,2427,3245,1512,3198,3456,2478,3474,3490,3491,3389,1,2617,3469,572,3826,2840,2318,388,78,606,653,2665,4040,2241,628,3363,716,4005,1182,3342,1187,1769,1771,1917,2097,2099,2160,2162,2249,2295,2044,2296,3615,2330,1053,1055,2351,2414,517,2186,2698,3033,3058,2011,3069,664,2733,3605,4265,4090,4223,3392,3395,2125,1050,1543,4493,4494,763,4495,2957,1327,399,3232,3233,3234,3238,1058,2187,3239,3246,3368,3369,3370,3372,4496,3375,4260,2030,4498,4379,3377,3440,1060,551,142,143,1459,1460,1609,1970,1971,1062,2134,2174,2176,2204,2437,2438,1750,2441,2442,2444,2749,2955,267,6,5,2993,2995,3044,3054,1608,3087,3269,3271,3140,3258,4370,3142,3143,774,3145,2753,2761,3147,3148,387,3193,1056,3195,3197,3199,3201,3241,3243,3251,2910,2928,3066,3254,3256,3260,4391,3262,436,4378,3329,3331,4298,2489,3333,3334,3337,3339,3345,3500,3502,3503,3506,3347,3349,3351,3352,2282,3354,3356,3361,3362,3380,1644,607,3391,3514,1114,4384,36,2239,28,2598,2304,1748,2767,1365,45,2353,53,2458,1526,61,63,452,122,2119,2522,91,2127,101,121,105,358,109,111,2338,113,2026,124,912,129,2246,135,137,139,141,147,3043,158,166,2325,168,867,182,184,2320,1484,2376,2036,2374,194,1800,200,204,1783,206,2208,210,212,214,216,1678,221,225,2052,235,237,241,247,251,253,255,259,261,2185,2115,1756,2790,281,2309,3215,2654,293,2095,297,2319,2060,309,1014,3272,322,325,327,329,3277,2633,2411,1999,2468,346,2841,350,365,369,2322,2699,383,2469,391,2639,3011,418,477,1673,428,430,443,478,2998,4323,462,2688,471,2766,476,489,496,498,504,511,969,515,2920,2487,1136,554,563,569,2356,594,2779,600,604,646,2280,3190,3465,3224,697,2671,1450,726,1494,733,1531,2226,778,1616,784,1664,804,1545,1140,837,845,1776,865,1851,887,892,898,904,907,1259,1154,1733,932,4324,1930,4326,942,944,947,1375,3019,972,1040,1010,1012,1022,1065,1940,1082,2339,1956,1731,1123,1108,2378,1116,1127,1130,1132,1147,2070,3028,2121,1150,1833,1172,1178,2324,2337,2453,1192,2220,1201,1203,1205,1208,1210,2627,1923,2474,1243,1257,2589,1280,2932,1566,1299,1318,3547,1326,1408,1405,1339,1368,2326,2063,3546,1370,1378,2613,2731,2614,1860,2552,2881,2059,2538,1413,1927,1419,1421,2645,1425,1429,1431,1433,1964,1441,1443,3049,1454,1456,1472,2534,3036,2537,1478,3102,2486,1499,2506,1507,2652,1530,1534,2252,1548,1554,1552,2450,2877,1574,1578,2759,1584,1588,1597,1982,1599,3029,1622,4337,2612,1627,1630,1634,1640,4395,2122,1672,3002,1458,1683,1691,1834,2672,1701,2966,1967,1714,2131,1727,3031,2401,1740,1744,1746,1755,1758,1760,2410,1773,1775,1778,2620,1786,2996,2128,2623,1912,2389,1807,4411,1809,2085,1822,1824,2660,2294,2365,3083,1853,1863,1868,1874,1878,2201,1881,1885,1896,2190,1905,2594,602,2449,1909,1911,1921,1916,1933,2847,1936,2259,1949,2392,1955,2889,1961,3103,1966,1978,1980,2391,1985,1993,2599,1996,1998,2050,2002,2192,2007,2014,2019,2719,2022,3152,2024,2028,2040,2042,2058,2640,3025,2757,2079,2945,2087,2091,2094,2102,2111,2777,2139,573,2821,2150,2149,2155,2544,2369,2170,2172,4338,2532,2184,2189,2195,2198,2340,2206,2211,2666,2230,2583,2999,3003,3020,2248,2253,2255,2257,2261,2263,2341,2268,2274,2273,2724,2284,2286,2830,2289,2291,2300,3222,2313,2642,2366,2333,2350,2359,2361,2363,2368,2371,2373,2382,2387,2394,2396,2407,2409,3585,2503,2420,2982,2431,2435,2457,2461,2465,2467,2476,2852,2480,2483,2491,2495,4374,4452,4359,2521,2524,2531,2536,2576,2554,2556,2770,2568,2572,2575,2578,2582,2585,3119,2597,2608,3553,2619,2630,2891,2657,2663,2931,2674,2677,2682,2685,2687,2694,2992,3062,2924,4367,2705,2707,2709,1410,3922,2723,2864,2742,2756,2763,2765,2769,4388,2776,2783,3016,2794,3132,4329,2810,2813,3013,2973,3146,2832,2834,2837,2876,2855,2922,3832,2859,2862,3180,2870,3126,2888,3188,2896,2898,3056,2903,2906,3161,2913,2916,660,2918,2926,2930,2936,3237,2934,3379,2943,2949,3586,2963,2972,2976,2968,2970,3108,3579,4341,2985,3007,3010,3022,3027,3040,3042,3048,3053,3060,3079,3112,3089,3096,3106,3117,3157,3134,3155,3163,3192,3170,3307,3185,3204,3208,3210,3212,3217,3804,675,3227,3249,3265,3267,3274,3276,3431,3422,3556,3424,3426,3436,3438,3448,3452,3458,3464,3476,3521,3545,3572,4390,4354,3595,632,3799,4328,4348,4340,4350,4352,4368,3072,3487,3497,3510,3511,3499,3508,3512,565,3537,3538,690,3557,3561,20,3570,3854,3600,4030,3601,3921,4201,3620,3625,3830,4011,3627,688,3565,544,548,3191,3633,3635,3637,3639,3641,609,613,3649,3652,307,3660,797,3666,3670,3672,3472,3679,3681,3685,3686,2739,3696,3698,3704,3366,3283,528,641,4400,3717,3720,465,3728,3732,3942,3733,3735,3533,3739,3741,3748,3883,3046,3104,4028,4515,4403,4405,3750,1770,3759,3760,3762,3763,3764,3767,3771,3882,4408,4410,4463,3777,3779,3781,3783,3786,586,3789,3792,3800,3894,3802,3807,3905,3813,1043,635,4480,634,3816,3831,3818,3821,3823,3825,3914,1972,3835,644,4415,3844,3848,3850,3840,615,652,3852,3853,3857,3865,3879,684,3949,3938,3955,3956,3441,720,3959,3963,4252,4503,3950,3968,3969,3971,3972,3977,3982,3873,3828,3988,3992,3993,2752,3995,4001,958,4002,4003,658,4008,4009,4012,4015,4024,4026,4027,4291,959,4420,4032,4033,963,4504,3943,3540,3945,4046,4047,4048,4052,4057,4061,747,4067,4069,4073,4059,3336,2680,4086,974,4088,4096,4098,4101,978,4111,4113,4114,3319,4430,4121,4124,4128,4343,4346,4129,4134,4107,4119,4427,4137,4139,4142,4143,4148,4150,4152,4156,3470,4162,4173,4177,4179,4180,4183,4184,4186,4188,4193,592,4236,4163,4165,523,3583,3723,3281,3367,3788,4169,4196,4418,4199,4203,4431,4205,4211,4213,4433,4214,4215,4216,4217,4221,765,4226,4434,4228,4230,4231,4233,4235,4238,4240,4242,4244,4245,4248,4209,4249,4257,4255,4259,4261,4253,4268,4269,4272,769,4437,4276,4279,4285,3979,4290,4288,4506,4282,4508,4295,4296,4300,4521,4304,3401,4038,4522,4311,4317,4318,4313,4320,4523,1032,4385,4387,4321,4510,4441,4103,4289,3138,3166,4445,3175,3385,3387,3388,4456,3172,4446,3898,2118,4419,4422,4373,3904,4380,3323,3327,3542,3468,4449,4451,4457,4459,3932,4447,4171,4516,4423,4461,4465,3702,4467,4382,4470,4471,4472,4476,4477,4478,4511,578,4525,4486,4487,4453,4146,714,4488,4491,2626,3530,3518,3520,667,4412,4502,4520,3953,10,4006,3710,4483,374,509,965,967,1446,99,4336,2429,2499,2679,245,4360,2911,2988,2991,352,3221,3293,3295,3482,3439,3473,2,3543,3353,3674,654,4041,4325,1188,1918,2098,2100,2161,2250,2297,3616,2331,1054,2352,2415,3890,3059,3068,3070,665,3606,4266,4091,4492,4526,4501,3235,3247,3373,3374,4497,3711,4499,4500,3378,1061,552,1461,1973,2177,208,2439,2440,2443,2445,2511,2658,2734,2954,3709,2404,2979,2994,3014,3055,3086,3270,4369,3141,3144,3617,3168,3196,3200,3202,3242,3244,3252,3420,3253,3255,3257,3259,3261,3263,437,3304,3330,3332,3415,3335,3338,3344,3346,3501,3504,3505,3507,3348,3350,3382,4383,3515,3397,3403,3404,3407,3409,3411,3414,3393,3357,3359,3417,550,3534,3444,3445,3477,3478,3493,3495,3492,579,3524,3526,3527,3528,3398,3399,3402,3405,3406,3410,3416,3446,560,3522,4393,3525,4518
			 ], false, false) a, pbn b
where b.source = a.id2