:- op(200, fy, not).
:- op(300, xfx, and).
:- op(300, xfx, or).
:- op(300, xfx, lshift).
:- op(300, xfx, rshift).
:- op(400, xfx, ->).

:- table(check/2).
check(X, X) :- number(X).
check(X, Y) :- wire(Y -> X), number(Y).
check(X, Y) :- wire(A -> X), atom(A), check(A, Y).
check(X, Y) :-
    wire(not A -> X),
    check(A, Va),
    Y is \Va.
check(X, Y) :-
    wire(A and B -> X),
    check(A, Va), check(B, Vb),
    Y is Va /\ Vb.
check(X, Y) :-
    wire(A or B -> X),
    check(A, Va), check(B, Vb),
    Y is Va \/ Vb.
check(X, Y) :-
    wire(A lshift N -> X),
    check(A, Va),
    Y is Va << N.
check(X, Y) :-
    wire(A rshift N -> X),
    check(A, Va),
    Y is Va >> N.

adv07(X) :- check(a, X).

wire(not dq -> dr).
wire(kg or kf -> kh).
wire(ep or eo -> eq).
wire(44430 -> b).        % Change to 3176 for part 2
wire(not gs -> gt).
wire(dd or do -> dp).
wire(eg and ei -> ej).
wire(y and ae -> ag).
wire(jx and jz -> ka).
wire(lf rshift 2 -> lg).
wire(z and aa -> ac).
wire(dy and ej -> el).
wire(bj or bi -> bk).
wire(kk rshift 3 -> km).
wire(not cn -> co).
wire(gn and gp -> gq).
wire(cq and cs -> ct).
wire(eo lshift 15 -> es).
wire(lg or lm -> ln).
wire(dy or ej -> ek).
wire(not di -> dj).
wire(1 and fi -> fj).
wire(kf lshift 15 -> kj).
wire(not jy -> jz).
wire(not ft -> fu).
wire(fs and fu -> fv).
wire(not hr -> hs).
wire(ck or cl -> cm).
wire(jp rshift 5 -> js).
wire(iv or jb -> jc).
wire(is or it -> iu).
wire(ld or le -> lf).
wire(not fc -> fd).
wire(not dm -> dn).
wire(bn or by -> bz).
wire(aj and al -> am).
wire(cd lshift 15 -> ch).
wire(jp and ka -> kc).
wire(ci or ct -> cu).
wire(gv and gx -> gy).
wire(de and dk -> dm).
wire(x rshift 5 -> aa).
wire(et rshift 2 -> eu).
wire(x rshift 1 -> aq).
wire(ia or ig -> ih).
wire(bk lshift 1 -> ce).
wire(y or ae -> af).
wire(not ca -> cb).
wire(e and f -> h).
wire(ia and ig -> ii).
wire(ck and cl -> cn).
wire(not jh -> ji).
wire(z or aa -> ab).
wire(1 and en -> eo).
wire(ib and ic -> ie).
wire(not eh -> ei).
wire(iy and ja -> jb).
wire(not bb -> bc).
wire(ha or gz -> hb).
wire(1 and cx -> cy).
wire(not ax -> ay).
wire(ev or ew -> ex).
wire(bn rshift 2 -> bo).
wire(er or es -> et).
wire(eu or fa -> fb).
wire(jp or ka -> kb).
wire(ea and eb -> ed).
wire(k and m -> n).
wire(et rshift 3 -> ev).
wire(et rshift 5 -> ew).
wire(hz rshift 1 -> is).
wire(ki or kj -> kk).
wire(not h -> i).
wire(lv lshift 15 -> lz).
wire(as rshift 1 -> bl).
wire(hu lshift 15 -> hy).
wire(iw and ix -> iz).
wire(lf rshift 1 -> ly).
wire(fp or fv -> fw).
wire(1 and am -> an).
wire(ap lshift 1 -> bj).
wire(u lshift 1 -> ao).
wire(b rshift 5 -> f).
wire(jq and jw -> jy).
wire(iu rshift 3 -> iw).
wire(ih and ij -> ik).
wire(not iz -> ja).
wire(de or dk -> dl).
wire(iu or jf -> jg).
wire(as and bd -> bf).
wire(b rshift 3 -> e).
wire(jq or jw -> jx).
wire(iv and jb -> jd).
wire(cg or ch -> ci).
wire(iu and jf -> jh).
wire(lx -> a).
wire(1 and cc -> cd).
wire(ly or lz -> ma).
wire(not el -> em).
wire(1 and bh -> bi).
wire(fb and fd -> fe).
wire(lf or lq -> lr).
wire(bn rshift 3 -> bp).
wire(bn and by -> ca).
wire(af and ah -> ai).
wire(cf lshift 1 -> cz).
wire(dw or dx -> dy).
wire(gj and gu -> gw).
wire(jg and ji -> jj).
wire(jr or js -> jt).
wire(bl or bm -> bn).
wire(gj rshift 2 -> gk).
wire(cj or cp -> cq).
wire(gj or gu -> gv).
wire(b or n -> o).
wire(o and q -> r).
wire(bi lshift 15 -> bm).
wire(dy rshift 1 -> er).
wire(cu and cw -> cx).
wire(iw or ix -> iy).
wire(hc or hd -> he).
wire(0 -> c).
wire(db or dc -> dd).
wire(kk rshift 2 -> kl).
wire(eq lshift 1 -> fk).
wire(dz or ef -> eg).
wire(not ed -> ee).
wire(lw or lv -> lx).
wire(fw and fy -> fz).
wire(dz and ef -> eh).
wire(jp rshift 3 -> jr).
wire(lg and lm -> lo).
wire(ci rshift 2 -> cj).
wire(be and bg -> bh).
wire(lc lshift 1 -> lw).
wire(hm and ho -> hp).
wire(jr and js -> ju).
wire(1 and io -> ip).
wire(cm and co -> cp).
wire(ib or ic -> id).
wire(not bf -> bg).
wire(fo rshift 5 -> fr).
wire(ip lshift 15 -> it).
wire(jt and jv -> jw).
wire(jc and je -> jf).
wire(du or dt -> dv).
wire(not fx -> fy).
wire(aw and ay -> az).
wire(ge lshift 15 -> gi).
wire(not ak -> al).
wire(fm or fn -> fo).
wire(ff and fh -> fi).
wire(ci rshift 5 -> cl).
wire(cz or cy -> da).
wire(not ey -> ez).
wire(not ju -> jv).
wire(not ls -> lt).
wire(kk and kv -> kx).
wire(not ii -> ij).
wire(kl and kr -> kt).
wire(jk lshift 15 -> jo).
wire(e or f -> g).
wire(not bs -> bt).
wire(hi and hk -> hl).
wire(hz or ik -> il).
wire(ek and em -> en).
wire(ao or an -> ap).
wire(dv lshift 1 -> ep).
wire(an lshift 15 -> ar).
wire(fo rshift 1 -> gh).
wire(not im -> in).
wire(kk rshift 1 -> ld).
wire(hw lshift 1 -> iq).
wire(ec and ee -> ef).
wire(hb lshift 1 -> hv).
wire(kb and kd -> ke).
wire(x and ai -> ak).
wire(dd and do -> dq).
wire(aq or ar -> as).
wire(iq or ip -> ir).
wire(dl and dn -> do).
wire(iu rshift 5 -> ix).
wire(as or bd -> be).
wire(not go -> gp).
wire(fk or fj -> fl).
wire(jm lshift 1 -> kg).
wire(not cv -> cw).
wire(dp and dr -> ds).
wire(dt lshift 15 -> dx).
wire(et rshift 1 -> fm).
wire(dy rshift 3 -> ea).
wire(fp and fv -> fx).
wire(not p -> q).
wire(dd rshift 2 -> de).
wire(eu and fa -> fc).
wire(ba and bc -> bd).
wire(dh and dj -> dk).
wire(lr and lt -> lu).
wire(he rshift 1 -> hx).
wire(ex and ez -> fa).
wire(df or dg -> dh).
wire(fj lshift 15 -> fn).
wire(not kx -> ky).
wire(gk or gq -> gr).
wire(dy rshift 2 -> dz).
wire(gh or gi -> gj).
wire(lj and ll -> lm).
wire(x or ai -> aj).
wire(bz and cb -> cc).
wire(1 and lu -> lv).
wire(as rshift 3 -> au).
wire(ce or cd -> cf).
wire(il and in -> io).
wire(dd rshift 1 -> dw).
wire(not lo -> lp).
wire(c lshift 1 -> t).
wire(dd rshift 3 -> df).
wire(dd rshift 5 -> dg).
wire(lh and li -> lk).
wire(lf rshift 5 -> li).
wire(dy rshift 5 -> eb).
wire(not kt -> ku).
wire(at or az -> ba).
wire(x rshift 3 -> z).
wire(not lk -> ll).
wire(lb or la -> lc).
wire(1 and r -> s).
wire(lh or li -> lj).
wire(ln and lp -> lq).
wire(kk rshift 5 -> kn).
wire(ea or eb -> ec).
wire(ci and ct -> cv).
wire(b rshift 2 -> d).
wire(jp rshift 1 -> ki).
wire(not cr -> cs).
wire(not jd -> je).
wire(jp rshift 2 -> jq).
wire(jn or jo -> jp).
wire(lf rshift 3 -> lh).
wire(1 and ds -> dt).
wire(lf and lq -> ls).
wire(la lshift 15 -> le).
wire(not fg -> fh).
wire(at and az -> bb).
wire(au and av -> ax).
wire(kw and ky -> kz).
wire(v or w -> x).
wire(kk or kv -> kw).
wire(ks and ku -> kv).
wire(kh lshift 1 -> lb).
wire(1 and kz -> la).
wire(not kc -> kd).
wire(x rshift 2 -> y).
wire(et or fe -> ff).
wire(et and fe -> fg).
wire(not ac -> ad).
wire(jl or jk -> jm).
wire(1 and jj -> jk).
wire(bn rshift 1 -> cg).
wire(not kp -> kq).
wire(ci rshift 3 -> ck).
wire(ev and ew -> ey).
wire(1 and ke -> kf).
wire(cj and cp -> cr).
wire(ir lshift 1 -> jl).
wire(not gw -> gx).
wire(as rshift 2 -> at).
wire(iu rshift 1 -> jn).
wire(cy lshift 15 -> dc).
wire(hg or hh -> hi).
wire(ci rshift 1 -> db).
wire(au or av -> aw).
wire(km and kn -> kp).
wire(gj rshift 1 -> hc).
wire(iu rshift 2 -> iv).
wire(ab and ad -> ae).
wire(da lshift 1 -> du).
wire(not bw -> bx).
wire(km or kn -> ko).
wire(ko and kq -> kr).
wire(bv and bx -> by).
wire(kl or kr -> ks).
wire(1 and ht -> hu).
wire(df and dg -> di).
wire(not ag -> ah).
wire(d or j -> k).
wire(d and j -> l).
wire(b and n -> p).
wire(gf or ge -> gg).
wire(gg lshift 1 -> ha).
wire(bn rshift 5 -> bq).
wire(bo or bu -> bv).
wire(1 and gy -> gz).
wire(s lshift 15 -> w).
wire(not ie -> if).
wire(as rshift 5 -> av).
wire(bo and bu -> bw).
wire(hz and ik -> im).
wire(bp and bq -> bs).
wire(b rshift 1 -> v).
wire(not l -> m).
wire(bp or bq -> br).
wire(g and i -> j).
wire(br and bt -> bu).
wire(t or s -> u).
wire(hz rshift 5 -> ic).
wire(gk and gq -> gs).
wire(fl lshift 1 -> gf).
wire(he rshift 3 -> hg).
wire(gz lshift 15 -> hd).
wire(hf or hl -> hm).
wire(1 and gd -> ge).
wire(fo or fz -> ga).
wire(id and if -> ig).
wire(fo and fz -> gb).
wire(gr and gt -> gu).
wire(he or hp -> hq).
wire(fq and fr -> ft).
wire(ga and gc -> gd).
wire(fo rshift 2 -> fp).
wire(gl or gm -> gn).
wire(hg and hh -> hj).
wire(not hn -> ho).
wire(gl and gm -> go).
wire(he rshift 5 -> hh).
wire(not gb -> gc).
wire(hq and hs -> ht).
wire(hz rshift 3 -> ib).
wire(hz rshift 2 -> ia).
wire(fq or fr -> fs).
wire(hx or hy -> hz).
wire(he and hp -> hr).
wire(gj rshift 5 -> gm).
wire(hf and hl -> hn).
wire(hv or hu -> hw).
wire(not hj -> hk).
wire(gj rshift 3 -> gl).
wire(fo rshift 3 -> fq).
wire(he rshift 2 -> hf).
