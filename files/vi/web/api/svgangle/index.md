---
title: SVGAngle
slug: Web/API/SVGAngle
page-type: web-api-interface
browser-compat: api.SVGAngle
---

{{APIRef("SVG")}}

Giao diện `SVGAngle` được dùng để đại diện cho một giá trị có thể là {{cssxref("&lt;angle&gt;")}} hoặc {{cssxref("&lt;number&gt;")}}.

`SVGAngle` được trả về từ {{domxref("SVGAnimatedAngle.animVal")}} và {{domxref("SVGAnimatedAngle.baseVal")}} là chỉ đọc, nhưng `SVGAngle` được trả về từ {{domxref("SVGSVGElement.createSVGAngle()")}} có thể ghi. Khi được chỉ định là chỉ đọc, các cố gắng sửa đổi đối tượng sẽ dẫn đến việc ném ra ngoại lệ.

Một đối tượng `SVGAngle` có thể được liên kết với một phần tử cụ thể. Phần tử liên kết được dùng để xác định phần tử nào có nội dung thuộc tính cần cập nhật nếu đối tượng phản ánh một thuộc tính. Nếu không được mô tả khác, một đối tượng `SVGAngle` không được liên kết với bất kỳ phần tử nào.

Mỗi đối tượng `SVGAngle` hoạt động theo một trong hai chế độ:

1. **_Phản ánh giá trị cơ sở_** của một thuộc tính có thể animate được phản ánh (được hiển thị thông qua thành viên {{domxref("SVGAnimatedAngle.baseVal", "baseVal")}} của {{domxref("SVGAnimatedAngle")}}),
2. **_Tách rời_**, đây là trường hợp của các đối tượng `SVGAngle` được tạo với {{domxref("SVGSVGElement.createSVGAngle()")}}.

## Thuộc tính phiên bản

- {{domxref("SVGAngle.unitType")}}
  - : Kiểu của giá trị được chỉ định bởi một trong các hằng số `SVG_ANGLETYPE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGAngle.value")}}
  - : Giá trị dưới dạng số thực dấu phẩy động, theo đơn vị người dùng. Việc đặt thuộc tính này sẽ khiến `valueInSpecifiedUnits` và `valueAsString` được cập nhật tự động để phản ánh cài đặt này.
- {{domxref("SVGAngle.valueInSpecifiedUnits")}}
  - : Giá trị dưới dạng số thực dấu phẩy động, theo đơn vị được biểu thị bởi `unitType`. Việc đặt thuộc tính này sẽ khiến `value` và `valueAsString` được cập nhật tự động để phản ánh cài đặt này.
- {{domxref("SVGAngle.valueAsString")}}
  - : Giá trị dưới dạng chuỗi, theo đơn vị được biểu thị bởi `unitType`. Việc đặt thuộc tính này sẽ khiến `value`, `valueInSpecifiedUnits`, và `unitType` được cập nhật tự động để phản ánh cài đặt này.

## Phương thức phiên bản

- {{domxref("SVGAngle.convertToSpecifiedUnits()")}}
  - : Giữ nguyên giá trị lưu trữ cơ bản, nhưng đặt lại định danh đơn vị lưu trữ về `unitType` đã cho. Các thuộc tính `unitType`, `valueInSpecifiedUnits`, và `valueAsString` của đối tượng có thể bị sửa đổi do phương thức này.
- {{domxref("SVGAngle.newValueSpecifiedUnits()")}}
  - : Đặt lại giá trị dưới dạng số với unitType liên kết, thay thế các giá trị của tất cả thuộc tính trên đối tượng.

## Thuộc tính tĩnh

- `SVG_ANGLETYPE_UNKNOWN` (0)
  - : Một số kiểu giá trị không xác định.
- `SVG_ANGLETYPE_UNSPECIFIED` (1)
  - : Một {{cssxref("&lt;number&gt;")}} không có đơn vị được hiểu là giá trị theo độ.
- `SVG_ANGLETYPE_DEG` (2)
  - : Một {{cssxref("&lt;angle&gt;")}} với đơn vị `deg`.
- `SVG_ANGLETYPE_RAD` (3)
  - : Một {{cssxref("&lt;angle&gt;")}} với đơn vị `rad`.
- `SVG_ANGLETYPE_GRAD` (4)
  - : Một {{cssxref("&lt;angle&gt;")}} với đơn vị `grad`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
