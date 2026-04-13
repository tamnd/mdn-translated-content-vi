---
title: "RTCRemoteOutboundRtpStreamStats: thuộc tính ssrc"
short-title: ssrc
slug: Web/API/RTCRemoteOutboundRtpStreamStats/ssrc
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_remote-outbound-rtp.ssrc
---

{{APIRef("WebRTC")}}

Thuộc tính **`ssrc`** của từ điển {{domxref("RTCRemoteOutboundRtpStreamStats")}} chứa một số nguyên dương xác định nguồn đồng bộ (SSRC) của luồng {{Glossary("RTP")}} này.

Nguồn có thể là thứ như một microphone, hoặc một ứng dụng trộn kết hợp nhiều nguồn.
Tất cả các gói từ cùng một nguồn chia sẻ cùng nguồn thời gian và không gian chuỗi, và do đó có thể được sắp xếp tương đối với nhau.
Lưu ý rằng hai luồng có cùng giá trị `ssrc` tham chiếu đến cùng một nguồn.

## Giá trị

Số nguyên 32-bit dương nhận dạng duy nhất SSRC của các gói RTP có thống kê được bao gồm bởi đối tượng {{domxref("RTCRemoteOutboundRtpStreamStats")}} này.

Cách thức tạo ra các giá trị SSRC không được đặc tả quy định, mặc dù nó đưa ra khuyến nghị.
Bạn không nên đưa ra bất kỳ giả định nào dựa trên giá trị của `ssrc` ngoài việc bất kỳ hai đối tượng nào có cùng `ssrc` tham chiếu đến cùng một nguồn.
Xem {{RFC("3550", "", "8")}} để biết thêm thông tin về `ssrc`.

> [!NOTE]
> Đặc tả bao gồm một ví dụ tạo ra các giá trị cho `ssrc` bằng MD5.
> Mặc dù không hoàn toàn là một phần của tiêu chuẩn, đây là một cơ chế tốt có thể được một số trình duyệt sử dụng; các trình duyệt khác có thể sử dụng các phương pháp khác, chẳng hạn như bộ tạo số ngẫu nhiên.
> _Đừng_ dựa vào các giá trị này có nghĩa gì khác hơn là "các đối tượng này được liên kết với cùng một nguồn."

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpReceiver.getSynchronizationSources()")}}
- {{domxref("RTCEncodedAudioFrame.getMetadata()")}}
