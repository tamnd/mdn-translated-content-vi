---
title: TouchList
slug: Web/API/TouchList
page-type: web-api-interface
browser-compat: api.TouchList
---

{{APIRef("Touch Events")}}

Giao diện **`TouchList`** đại diện cho danh sách các điểm tiếp xúc trên bề mặt cảm ứng. Ví dụ, nếu người dùng có ba ngón tay trên bề mặt cảm ứng (như màn hình hoặc trackpad), đối tượng `TouchList` tương ứng sẽ có một đối tượng {{domxref("Touch")}} cho mỗi ngón tay, tổng cộng ba mục.

Giao diện này là [nỗ lực tạo danh sách không thể sửa đổi](https://stackoverflow.com/questions/74630989/why-use-domstringlist-rather-than-an-array/74641156#74641156) và chỉ tiếp tục được hỗ trợ để không phá vỡ mã đã sử dụng nó. Các API hiện đại đại diện cho các cấu trúc danh sách sử dụng các kiểu dựa trên [mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) JavaScript, do đó cung cấp nhiều phương thức mảng, và đồng thời áp đặt các ngữ nghĩa bổ sung trên cách sử dụng của chúng (như làm cho các mục của chúng chỉ đọc).

Những lý do lịch sử này không có nghĩa là bạn với tư cách là nhà phát triển nên tránh `TouchList`. Bạn không tự tạo các đối tượng `TouchList`, mà lấy chúng từ các API như {{domxref("TouchEvent.targetTouches")}}, và các API này không bị lỗi thời. Tuy nhiên, hãy cẩn thận về sự khác biệt ngữ nghĩa so với mảng thực.

## Thuộc tính phiên bản

- {{domxref("TouchList.length")}} {{ReadOnlyInline}}
  - : Số lượng đối tượng {{domxref("Touch")}} trong `TouchList`.

## Phương thức phiên bản

- {{domxref("TouchList.item()")}}
  - : Trả về đối tượng {{domxref("Touch")}} tại chỉ số được chỉ định trong danh sách.

## Ví dụ

Xem [ví dụ trên bài viết Touch events chính](/en-US/docs/Web/API/Touch_events#examples).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Touch events](/en-US/docs/Web/API/Touch_events)
- {{domxref("Document.createTouchList()")}}
