---
title: "RTCOutboundRtpStreamStats: ssrc property"
short-title: ssrc
slug: Web/API/RTCOutboundRtpStreamStats/ssrc
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_outbound-rtp.ssrc
---

{{APIRef("WebRTC")}}

Thuộc tính **`ssrc`** của từ điển {{domxref("RTCOutboundRtpStreamStats")}} chứa giá trị số nguyên dương xác định nguồn đồng bộ hóa (SSRC) của luồng {{Glossary("RTP")}} này.

Một nguồn có thể là microphone hoặc ứng dụng mixer kết hợp nhiều nguồn. Tất cả các gói từ cùng một nguồn đều dùng chung nguồn thời gian và không gian chuỗi, do đó có thể được sắp xếp theo thứ tự so với nhau. Lưu ý rằng hai luồng có cùng giá trị `ssrc` đề cập đến cùng một nguồn.

## Giá trị

Số nguyên 32-bit dương xác định duy nhất SSRC của các gói RTP có thống kê được bao gồm trong đối tượng {{domxref("RTCOutboundRtpStreamStats")}} này.

Cách tạo ra giá trị SSRC không được đặt ra trong đặc tả, mặc dù đặc tả có đưa ra khuyến nghị. Bạn không nên đưa ra bất kỳ giả định nào dựa trên giá trị của `ssrc` ngoài việc bất kỳ hai đối tượng nào có cùng `ssrc` đều đề cập đến cùng một nguồn. Xem {{RFC("3550", "", "8")}} để biết thêm thông tin về `ssrc`.

> [!NOTE]
> Đặc tả bao gồm một ví dụ tạo giá trị cho `ssrc` bằng MD5. Mặc dù không hoàn toàn là một phần của tiêu chuẩn, đây là một cơ chế tốt có thể được một số trình duyệt sử dụng; các trình duyệt khác có thể dùng các phương pháp khác, chẳng hạn như bộ tạo số ngẫu nhiên. _Không_ dựa vào các giá trị này có nghĩa gì ngoài "các đối tượng này được liên kết với cùng một nguồn."

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCRtpReceiver.getSynchronizationSources()")}}
- {{domxref("RTCEncodedAudioFrame.getMetadata()")}}
