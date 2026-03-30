---
title: Salt
slug: Glossary/Salt
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong mật mã học, **salt** (muối) là dữ liệu ngẫu nhiên được thêm vào mật khẩu trước khi nó được {{glossary("hash function", "băm")}}. Điều này khiến kẻ tấn công không thể suy ra mật khẩu từ các giá trị băm của chúng bằng cách sử dụng các bảng mật khẩu được tính toán trước và các giá trị băm tương ứng.

Mật khẩu không bao giờ nên được lưu trữ dưới dạng văn bản thuần túy, do nguy cơ kẻ tấn công có thể xâm nhập vào cơ sở dữ liệu nơi chúng được lưu. Thông thường, mật khẩu được băm và giá trị băm kết quả được lưu trữ. Nếu hàm băm an toàn về mặt mật mã, thì ngay cả khi kẻ tấn công truy cập được các giá trị băm đã lưu, việc đảo ngược hàm đó là không khả thi trong thực tế.

Để suy ra mật khẩu từ giá trị băm, kẻ tấn công có thể tra cứu mật khẩu tương ứng với một giá trị băm trong bảng được tính toán trước (còn gọi là [rainbow table](https://en.wikipedia.org/wiki/Rainbow_table)) ánh xạ các mật khẩu có thể với giá trị băm của chúng:

| Mật khẩu | Băm        |
| -------- | ----------- |
| pa55w0rd | 56965E2A... |
| abcdef   | BEF57EC7... |
| letmein  | 1C8BFE8F... |

Mặc dù các bảng này có thể rất lớn, nhưng các cuộc tấn công như vậy có thể hiệu quả vì tra cứu bảng là thao tác nhanh.

Việc thêm salt ngẫu nhiên vào mật khẩu trước khi băm sẽ ngăn cuộc tấn công này hoạt động, vì giá trị băm không chỉ được tính dựa trên mật khẩu mà còn dựa trên mật khẩu kết hợp với salt.

Không giống như mật khẩu, salt không cần được giữ bí mật: nó có thể được lưu cùng với mật khẩu đã thêm salt và băm trong cơ sở dữ liệu của máy chủ.
