//
//  ContentView.swift
//  ScheduleView
//
//  Created by next on 11/02/26.
//


import SwiftUI

struct ScheduleView: View {

    @State private var showAll = false

    let events: [ScheduleEvent] = [
        ScheduleEvent(title: "International Source of authority", time: "10:00 AM - 11:00 AM", type: .join),
        ScheduleEvent(title: "HW - Why do we separate pakistan from India", time: "10:00 AM - 11:00 AM", type: .active),
        ScheduleEvent(title: "Science Class", time: "11:00 AM - 12:00 PM", type: .join),
        ScheduleEvent(title: "Math Homework", time: "12:00 PM - 01:00 PM", type: .active)
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text("Schedules for today")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(hex: "#000000"))
                
                Spacer()
                
                Image("Group 78944")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding(10)
                    .background(Color(hex: "#30558E").opacity(0.12))
                    .clipShape(Circle())
            }
            .padding(.horizontal, 16)

            ForEach(displayedEvents) { event in
                if event.type == .join {
                    ScheduleCardWithJoin(title: event.title, time: event.time)
                } else {
                    ScheduleCardActive(title: event.title, time: event.time)
                }
            }

            if events.count > 3 {
                Button(action: {
                    showAll.toggle()
                }) {
                    HStack {
                        Spacer()
                        Text(showAll ? "View Less" : "View More")
                            .font(.system(size: 14, weight: .medium))
                        Image(showAll ? "chevron-up" : "chevron_right_black_24dp (14)")
                            .frame(width: 20, height: 20)

                        Spacer()
                    }
                    .foregroundColor(Color(hex: "#2F353B"))
                }
                .padding(.top, 13)
            }

            Spacer()
        }
        .background(Color(hex: "#ffffff"))
        .padding(.top, 16)
    }

    // MARK: - Display Logic
    private var displayedEvents: [ScheduleEvent] {
        if showAll {
            return events
        } else {
            return Array(events.prefix(3))
        }
    }
}
struct ScheduleCardWithJoin: View {

    let title: String
    let time: String

    var body: some View {
        HStack(spacing: 12) {

            Image("person")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: "#222222"))
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(time)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(hex: "#737373"))
            }

            Spacer()

            Button(action: {}) {
                HStack(spacing: 4.75) {
                    Image("Path 82803")
                    Text("Join")
                }
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color(hex: "#F8FAFC"))
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(hex: "#30558E"))
                .cornerRadius(20)
            }
        }
        .padding(16)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "#F0F4F7"), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.03), radius: 4, x: 0, y: 2)
        .padding(.horizontal, 16)

    }
}
struct ScheduleCardActive: View {

    let title: String
    let time: String

    var body: some View {
        HStack(spacing: 12) {

           
            Image("Path 83503")
                .foregroundColor(Color(hex: "#FFFFFF"))
                .frame(width: 40, height: 40)
                .background(Color(hex: "#F59800"))
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: "#222222"))
                    .lineLimit(1)
                    .truncationMode(.tail)

                Text(time)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(Color(hex: "#737373"))
            }

            Spacer()

            HStack(spacing: 6) {
                Image("Group 77910")
                Text("Active")
                    .font(.system(size: 11, weight: .medium))
            }
            
            .foregroundColor(Color(hex: "F2711D"))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color(hex: "#F2711D").opacity(0.12))
            .cornerRadius(16)
        }
        .padding(16)
        .background(Color(hex: "#FFFFFF"))
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(hex: "#F0F4F7"), lineWidth: 1)
        )
        .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 2)
        .padding(.horizontal, 16)
    }
}

extension Color {

    init(hex: String, opacity: Double = 1.0) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let r, g, b: UInt64

        switch hex.count {
        case 6: // RGB (24-bit)
            (r, g, b) = (
                (int >> 16) & 0xFF,
                (int >> 8) & 0xFF,
                int & 0xFF
            )
        default:
            (r, g, b) = (0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: opacity
        )
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}

