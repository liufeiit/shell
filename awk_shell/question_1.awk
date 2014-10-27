#!/bin/awk -f

{
if($4=="/user/presentgift"){

	if($11=="1000"){
        split($13, params, "&")
        for(p in params) {
                
		
		for(p1 in params){
			if(match(params[p1], "amount")) {
				split(params[p1], cv, "=");
				count = cv[2];
			}
		}

		if(match(params[p], "gift_id")) {
                        split(params[p], pv, "=");
			
                        gift[pv[2]] += count;
                        if(pv[2]==1){charmall += (count * 2)};
                        if(pv[2]==2){charmall += (count * 5)};
                        if(pv[2]==3){charmall += (count * 10)};
                        if(pv[2]==4){charmall += (count * 50)};
                        if(pv[2]==5){charmall += (count * 100)};
                        if(pv[2]==6){charmall += (count * 600)};
                        if(pv[2]==7){charmall += (count * 1500)};
                        if(pv[2]==8){charmall += (count * 3000)};
                        if(pv[2]==9){charmall += (count * 15000)};
                        if(pv[2]==10){charmall += (count * 60000)};
                        if(pv[2]==11){charmall += (count * 150000)};
                        if(pv[2]==12){charmall += (count * 300000)};
                        if(pv[2]==15){charmall += (count * 600)};
                        if(pv[2]==16){charmall += (count * 600)};
                }
        }
	}
}
}
END{
	
	FS=" "
	ORS="\n"
	print "日期:" substr(FILENAME, 26, 10);
	for(g in gift){
		if(g == 1){print "花", gift[g]};
		if(g == 2){print "布娃娃熊", gift[g]};
		if(g == 3){print "蛋糕", gift[g]};
		if(g == 4){print "扇子", gift[g]};
		if(g == 5){print "化妆品", gift[g]};
		if(g == 6){print "手机", gift[g]};
		if(g == 7){print "鞋子", gift[g]};
		if(g == 8){print "内衣", gift[g]};
		if(g == 9){print "包包", gift[g]};
		if(g == 10){print "钻石", gift[g]};
		if(g == 11){print "跑车", gift[g]};
		if(g == 12){print "别墅", gift[g]};
		if(g == 15){print "七夕玫瑰", gift[g]};
		if(g == 16){print "中秋月饼", gift[g]};
	}
	print "总魅力值：";
	print charmall;
}
