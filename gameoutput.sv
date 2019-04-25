program gameoutput(
    input logic reset, clk, 
    input logic s6, s5, s4, s3, s2, s1, s0, sw
    );
    int i = 0;
    int k = 0;
initial begin
forever begin
    @(posedge s0)begin
        if(sw) begin
            $display("For some reason you return to the cave of the origin of your journey, clutching your sword tightly.\n");
        end
        else begin
            i = 0;
            k = 0;
            $display("You come to the start of your adventure, you're not sure of how you got here, but what you do realize is that you're in a cave,");
            $display("with an open hole leading to a tunnel to the east.\n");
        end
    end
end
end

initial begin
forever begin
    @(posedge s1)begin
        if(sw) begin
            $display("You head through the tunnel, fully well knowing where it goes but heading through it anyways, gripping your sword vicariously.\n");
            k = k + 1;
        end
        else if(k % 2) begin
            $display("After finishing your pointless excursion to the place of your origin, likely due to your cowardly nature, you finally give up and");
            $display("realize that you must defeat the dragon that is east of the river, with a SWORD(thanks you made me spoil it). You enter the tunnel");
            $display("with you head held high, you must defeat the dragon, but first you must soak your clothes once more to the south.");
        end
        else begin
            $display("You enter the hole and start walking. Winding through the tunnel, you hear the rush of water around a bend going south.\n");
        end   
    end
end
end

initial begin
forever begin
    @(posedge s2)begin
        if(sw) begin
            $display("Clutching your sword with arms outstretched above your head, you wade through the water. The tunnels you first came from to the"); 
            $display("north, the secret armory to the west, and an ominous warmth and the rank of flesh and blood to the east.\n");
        end
        else begin
            $display("You come upon a raging, rapidly flowing river, you spot an odd set of statues to the west, and to the east, you sense a presence");
            $display("that you don't believe you're quite prepared enough for to confront.\n");
        end
    end
end
end

initial begin
forever begin
    @(posedge s3)begin
        if(i) begin
            $display("You return to the hidden store for literally no reason, as you have already claimed its powerful loot.\n");
        end       
        else begin 
            $display("You come upon the statues, inspecting them for their purpose. You fondly gaze upon the sword one of the depictions is carrying,");
            $display("pressing your hand against the blade as if the statue might hand it off to you. No sooner than the instant you press the sword,");
            $display("a secret wall comes down, opening passage to a hidden sword. Inside, you spot a glimmering sword. You pick it up, and you hear");
            $display("a faint voice from a spirit of a past life saying a single word \"Vorpal\". You clasp the sword Vorpal intently, now prepared");
            $display("for any adversary. You hear a terrifying roar to the east.\n");
            i = i + 1;
        end
    end
end
end

initial begin
forever begin
    @(posedge s4)begin
        if(sw) begin
            $display("You approach a doorway where the reek of dead overcomes you; your sword vorpal seemingly reacting, vibrating and giving you a");
            $display("burst of courage to open the door.\n");
            $display("The room is dark. You can faintly make out the sound of heavy breathing. It opens its amber glowing eyes. The now awake");
            $display("dragon sees you, and rises from its slumber, ravenously eyeing you as its next meal. Vorpal trembles in your grasp, you");
            $display("clutch it bravely. The dragon lets out a torrent of flames; you prepare for your imminent death and close your eyes when");
            $display("suddenly the heat is gone. You open your eyes in shock to see a shield eminating from Vorpal, protecting you from the hellfire.");
            $display("The dragon reacts with similar shock, roaring from displeasure at its folly. You take this chance to rush it, Vorpal encouraging");
            $display("you now more than ever and pulling you to the belly of the dragon. The dragon doesn't realize your rush, and you're granted an");
            $display("target to thrust your might sword into. You pierce the belly of the dragon with Vorpal, and its magic begins flowing through its");
            $display("prey. The magic courses through the beast, and the dragon lets out the beginning of a roar of terror before exploding into a mass");
            $display("of magic, dissolving into non-existance. You take a moment to realize your monumental victory.\n");
        end
        else begin
            $display("You approach a doorway where the reek of dead overcomes you; quivering in fear you open the door. You walk inside, somehow with");
            $display("balls of steel as you seek whatever adversary you might battle with just your fists. The room is dark, you can faintly make out");
            $display("the sound of heavy breathing. It opens its amber glowing eyes. The now awake dragon sees you, and rises from its slumber,");
            $display("ravenously eyeing you as its next meal. You quickly realize the folly of your ways, morosely looking at your inadequate fists.");
            $display("The dragon lets out a torrent of flames and you prepare for your eminent death.\n");
        end
    end
end
end

initial begin
forever begin
    @(posedge s5)begin
        $display("You step upon your defeated foe, holding your mighty sword Vorpal to the sky in a declaration of victory.");
        $display("YOU WIN!\n");
    end
end
end

initial begin
forever begin    
    @(posedge s6)begin
        $display("You feel the flames take you as you fall into the piles of bones around you. You grieve for your fate, quandarying whether a weapon");
        $display("would have changed your fate. If only you had another chance.");
        $display("YOU LOSE. GOOD DAY, SIR.\n");
    end
end
end



endprogram