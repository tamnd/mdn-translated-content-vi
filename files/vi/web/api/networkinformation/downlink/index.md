---
title: "NetworkInformation: thuộc tính downlink"
short-title: downlink
slug: Web/API/NetworkInformation/downlink
page-type: web-api-instance-property
browser-compat: api.NetworkInformation.downlink
---

{{APIRef("Network Information API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`downlink`** của giao diện {{domxref("NetworkInformation")}} trả về ước tính băng thông hiệu dụng tính bằng megabit mỗi giây, làm tròn đến bội số gần nhất của 25 kilobit mỗi giây. Giá trị này dựa trên thông lượng tầng ứng dụng quan sát gần đây trên các kết nối đang hoạt động, ngoại trừ các kết nối đến không gian địa chỉ riêng. Trong trường hợp không có dữ liệu đo lường băng thông gần đây, giá trị thuộc tính được xác định dựa trên các thuộc tính của công nghệ kết nối bên dưới.

## Giá trị

Một số.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Downlink")}}
