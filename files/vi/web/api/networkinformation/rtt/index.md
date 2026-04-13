---
title: "NetworkInformation: thuộc tính rtt"
short-title: rtt
slug: Web/API/NetworkInformation/rtt
page-type: web-api-instance-property
browser-compat: api.NetworkInformation.rtt
---

{{apiref("Network Information API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`rtt`** của giao diện {{domxref("NetworkInformation")}} trả về ước tính thời gian khứ hồi hiệu dụng của kết nối hiện tại, làm tròn đến bội số gần nhất của 25 mili giây. Giá trị này dựa trên các phép đo RTT tầng ứng dụng quan sát gần đây trên các kết nối đang hoạt động. Nó không bao gồm các kết nối đến không gian địa chỉ riêng. Nếu không có dữ liệu đo lường gần đây, giá trị dựa trên các thuộc tính của công nghệ kết nối bên dưới.

## Giá trị

Một số.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("RTT")}}
