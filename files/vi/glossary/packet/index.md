---
title: Gói tin
slug: Glossary/Packet
page-type: glossary-definition
sidebar: glossarysidebar
---

Gói tin (packet) hay gói mạng (network packet) là một đoạn dữ liệu được định dạng gửi qua mạng. Các thành phần chính của gói mạng là dữ liệu người dùng và thông tin điều khiển. Dữ liệu người dùng còn gọi là _payload_ (tải trọng). Thông tin điều khiển là thông tin để chuyển phát payload. Nó bao gồm địa chỉ mạng của nguồn và đích, thông tin sắp xếp thứ tự, và mã phát hiện lỗi — thường được đặt trong phần đầu (header) và phần cuối (footer) của gói tin.

## Nội dung của gói tin

### Hop limit (giới hạn bước nhảy)

Một hop (bước nhảy) xảy ra khi một gói tin được chuyển từ mạng này sang mạng khác. Đây là một trường giảm đi một mỗi khi gói tin đi qua; khi hop limit đạt 0, thao tác gửi thất bại và gói tin bị loại bỏ.

Theo thời gian, các gói tin có thể bị kẹt trong các vòng lặp khép kín, số lượng gói tin lưu thông sẽ tích lũy và cuối cùng dẫn đến mạng bị tê liệt.

### Phát hiện và sửa lỗi

Phát hiện và sửa lỗi là các mã được dùng để phát hiện và áp dụng sửa chữa cho các lỗi xảy ra khi dữ liệu được truyền tới người nhận. Có hai loại sửa lỗi: sửa lỗi ngược (backward) và sửa lỗi tiến (forward). Sửa lỗi ngược là khi người nhận yêu cầu bên gửi truyền lại toàn bộ đơn vị dữ liệu. Sửa lỗi tiến là khi người nhận sử dụng mã sửa lỗi để tự động sửa các lỗi.

Ở bên gửi, phép tính được thực hiện trước khi gói tin được gửi. Khi nhận ở đích, checksum được tính lại và so sánh với checksum trong gói tin.

### Ưu tiên

Trường này cho biết gói tin nào được ưu tiên hơn so với các gói khác. Hàng đợi ưu tiên cao được xử lý nhanh hơn các hàng đợi ưu tiên thấp hơn khi mạng tắc nghẽn.

### Địa chỉ

Khi định tuyến gói mạng, cần có hai địa chỉ mạng: địa chỉ nguồn của máy chủ gửi và địa chỉ đích của máy chủ nhận.

### Dữ liệu người dùng - Payload

Payload là dữ liệu được truyền thay mặt cho một ứng dụng. Nó thường có độ dài biến đổi, tối đa theo giới hạn được đặt bởi giao thức mạng và đôi khi là thiết bị trên đường truyền.

## Xem thêm

- [Network packet](https://en.wikipedia.org/wiki/Network_packet)
- [Hop (networking)](<https://en.wikipedia.org/wiki/Hop_(networking)>)
- [How error detection and correction works](https://www.techradar.com/news/computing/how-error-detection-and-correction-works-1080736)
