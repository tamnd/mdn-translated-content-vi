---
title: TimeRanges
slug: Web/API/TimeRanges
page-type: web-api-interface
browser-compat: api.TimeRanges
---

{{APIRef("HTML DOM")}}

Khi tải tài nguyên phương tiện để sử dụng bởi phần tử {{HTMLElement("audio")}} hoặc {{HTMLElement("video")}}, giao diện **`TimeRanges`** được sử dụng để đại diện cho các khoảng thời gian của tài nguyên phương tiện đã được đệm, các khoảng thời gian đã được phát và các khoảng thời gian có thể tìm kiếm.

Đối tượng `TimeRanges` bao gồm một hoặc nhiều khoảng thời gian, mỗi khoảng được chỉ định bởi offset bắt đầu và offset kết thúc. Bạn tham chiếu từng khoảng thời gian bằng cách sử dụng các phương thức `start()` và `end()`, truyền số chỉ mục của khoảng thời gian bạn muốn lấy.

## Đối tượng TimeRanges chuẩn hóa

Một số thành viên của các đối tượng {{domxref("HTMLMediaElement")}} trả về **đối tượng TimeRanges chuẩn hóa**, [mà đặc tả mô tả](https://html.spec.whatwg.org/multipage/media.html#normalised-timeranges-object) như có các đặc điểm sau:

_Các khoảng trong đối tượng như vậy được sắp xếp theo thứ tự, không chồng chéo và không chạm nhau (các khoảng liền kề được gộp thành một khoảng lớn hơn). Một khoảng có thể trống (chỉ tham chiếu một khoảnh khắc trong thời gian)._

## Thuộc tính phiên bản

- {{domxref("TimeRanges.length")}} {{ReadOnlyInline}}
  - : Trả về `unsigned long` đại diện cho số khoảng thời gian được đại diện bởi đối tượng khoảng thời gian.

## Phương thức phiên bản

- {{domxref("TimeRanges.start()")}}
  - : Trả về thời gian cho điểm bắt đầu của khoảng có chỉ mục được chỉ định.
- {{domxref("TimeRanges.end()")}}
  - : Trả về thời gian cho điểm kết thúc của khoảng được chỉ định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
