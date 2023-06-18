//
//  ReviewCondensedView.swift
//  AniiChan
//
//  Created by Joel Sifres Clemente on 18/6/23.
//

import SwiftUI

struct ReviewCondensedView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: "https://s4.anilist.co/file/anilistcdn/user/avatar/large/b47276-HVV4cFqvS7fm.jpg")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                    case .failure, .empty:
                        EmptyView()
                    @unknown default:
                        EmptyView()
                    }
                }
                .cornerRadius(5)
                
                Text("To me, 3-gatsu no Lion is the epitome of human emotion, an experience rivalled by none.")
                    .font(.subheadline)
                    .italic()
            }
            
            Text("""
            A strong display of emotional resonance; the second season of 3-gatsu no Lion manages to go above and beyond expectations to provide something of overwhelming beauty.
            
            It’s a show of many acts; the first season—while boasting many heavy themes—is an elegant watch, which reels the viewer in with a soft mood, realistic characters and delightful interactions, but never hits you with strong emotions. The second season—filled with melancholic tones, depressing themes and powerful messages—gives the show raw emotional power to invest the viewer at full force.
            
            Shifting from the focus of Rei’s depression, this season brings more focus to the different mentalities of the supporting cast, both in the real world and the back-drop of shogi.
            
            The season starts off with a focus on Hinata, and the daunting problem of bullying. Bringing forth an insight into the mass hysteria it brings and the draining effects on the victims, and those caught up in the drama. This arc is nothing short of impactful, and although it’s heavy, it never becomes painful to watch, something many other drama-oriented series fail to accomplish.
            
            What makes this so powerful is down to the commonly relatable topic of bullying, the powerful visual presentation and the amazing characterisation found in the antagonist Megumi Takagi.
            
            Megumi’s construct as a bully sets her apart from other archetypical antagonists—in the sense that, there are reasons to her actions—she clearly suffers problems in her mentality, leading her to torment others as a form of escapism, giving her somewhat an ability to be emphasised with for the wrong reason. It’s even easier to empathise with Hina, due to her characteristics, with her helping Rei with his struggles and inspiring him to escape his depression. Rei feels the same on the topic of helping her, creating a close bond between the two, something that plays importance throughout the rest of this season.
            
            Although the first arc is definitely in the lime-light of this season, the series continues to impress in its focuses on different characters. The character study of Souya Touji is a breath-taking display of a mind disturbed solely by the life-style of shogi, with stunning direction to show his inability to hear those around him. The shogi match between Shimada and Yanagiharai uses profound visual imagery to show the determination of both characters and the weight Yanagihara carries. And the pleasant moments with Hina give the show a relaxing and charming escapism from the heavier themes.
            
            I don’t consider the cast to be merely characters, they feel human. From Rei to Nikaidou to Yanagihara; each one has strong human characteristics that allow for relatability and empathy for these personalities as we see into their differing lives.
            Even though Rei has less focus this season, his role as the lead character is as strong as ever as he seeks a way to help those around him. It’s inspiring to watch, as Rei’s empathy drives him to assist in fighting the varying problems that arise for everyone close to him. His outlook and narration provide a strong connection from the viewer as he continues to improve his life which was once locked in place by his haunting past. As the main character, his journey is an impeccable experience and he is character of relatability and complexity.
            
            This season exposes elements of characters unbeknownst from the first season, such as the extent of Nikadou’s illness, the pressure Akari feels being unable to help Hina and the different psychological and emotional effects each character experiences in accordance to their surroundings. Each revelation is equally as tense and creates stronger connection to the characters once their situations are understood.
            
            Studio SHAFT empowers storytelling through visual motifs and stunning presentation, bringing everything to life with powerful imagery to reflect the mood each scene portrays. Every visual element is a sight to behold, with gorgeous backgrounds, varying styles and ability to speak many words through its delivery that bring out many emotions from the viewer.
            
            This mood is only enhanced by the stunning soundtrack composition. Melancholic tracks reflecting the depressing yet elegant mood can easily bring you to tears, acting as peaceful additions to the stunning composition of visuals and story.
            
            For a while now I’ve been pondering over the topic of depression, this in turn has affected the way I view anime titles, and what I get out of said titles. While Cardcaptor Sakura healed me from having negative thoughts, End of Evangelion’s existential elements blew my mind away so much that the thought of depression was no longer on my mind. But, I think the best form of escapism from a feeling like depression is facing it head on, and that’s exactly what 3-gatsu gave me; giving me personal affection to its elements.
            
            To me, 3-gatsu no Lion is the epitome of human emotion, an experience rivalled by none. A show that has brought me to tears almost every episode, and something I hope many others can appreciate in the same way.
            """)
            .lineLimit(3)
            
            HStack {
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                    Text("89")
                }
                
                Spacer()
                
                NavigationLink {
                    ReviewDetailView()
                } label: {
                    Text("Full review")
                    Image(systemName: "chevron.right")
                }
            }
        }
        .padding()
        .background(Color(uiColor: .systemGroupedBackground))
        .cornerRadius(10)
    }
}


struct ReviewCondensedView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCondensedView()
    }
}
