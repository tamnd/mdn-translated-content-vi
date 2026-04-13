---
title: SVGLength
slug: Web/API/SVGLength
page-type: web-api-interface
browser-compat: api.SVGLength
---

{{APIRef("SVG")}}

Giao diện **`SVGLength`** tương ứng với kiểu dữ liệu cơ bản [\<length>](/en-US/docs/Web/SVG/Guides/Content_type#length).

Một đối tượng `SVGLength` có thể được chỉ định là chỉ đọc, nghĩa là các cố gắng sửa đổi đối tượng sẽ dẫn đến việc ném ra ngoại lệ.

## Thuộc tính phiên bản

- {{domxref("SVGLength.unitType", "unitType")}}
  - : Kiểu của giá trị được xác định bởi một trong các hằng số `SVG_LENGTHTYPE_*` được định nghĩa trên giao diện này.
- {{domxref("SVGLength.value", "value")}}
  - : Giá trị dưới dạng số thực dấu phẩy động, theo đơn vị người dùng.
- {{domxref("SVGLength.valueAsString", "valueAsString")}}
  - : Giá trị dưới dạng chuỗi, theo đơn vị được biểu thị bởi `unitType`.
- {{domxref("SVGLength.valueInSpecifiedUnits", "valueInSpecifiedUnits")}}
  - : Giá trị dưới dạng số thực dấu phẩy động, theo đơn vị được biểu thị bởi `unitType`.

## Phương thức phiên bản

- {{domxref("SVGLength.convertToSpecifiedUnits", "convertToSpecifiedUnits()")}}
  - : Giữ nguyên giá trị lưu trữ cơ bản, nhưng đặt lại định danh đơn vị lưu trữ về `unitType` đã cho.
- {{domxref("SVGLength.newValueSpecifiedUnits", "newValueSpecifiedUnits()")}}
  - : Đặt lại giá trị dưới dạng số với `unitType` liên kết, thay thế các giá trị của tất cả thuộc tính trên đối tượng.

## Thuộc tính tĩnh

- `SVG_LENGTHTYPE_UNKNOWN` (0)
  - : Kiểu đơn vị không phải là một trong các kiểu đơn vị được định nghĩa sẵn. Không hợp lệ khi cố định nghĩa giá trị mới của kiểu này hay cố chuyển đổi giá trị hiện tại sang kiểu này.
- `SVG_LENGTHTYPE_NUMBER` (1)
  - : Không có kiểu đơn vị được cung cấp (tức là giá trị không có đơn vị), cho biết giá trị theo đơn vị người dùng.
- `SVG_LENGTHTYPE_PERCENTAGE` (2)
  - : Giá trị phần trăm được chỉ định.
- `SVG_LENGTHTYPE_EMS` (3)
  - : Giá trị được chỉ định bằng đơn vị `em`.
- `SVG_LENGTHTYPE_EXS` (4)
  - : Giá trị được chỉ định bằng đơn vị `ex`.
- `SVG_LENGTHTYPE_PX` (5)
  - : Giá trị được chỉ định bằng đơn vị `px`.
- `SVG_LENGTHTYPE_CM` (6)
  - : Giá trị được chỉ định bằng đơn vị `cm`.
- `SVG_LENGTHTYPE_MM` (7)
  - : Giá trị được chỉ định bằng đơn vị `mm`.
- `SVG_LENGTHTYPE_IN` (8)
  - : Giá trị được chỉ định bằng đơn vị `in`.
- `SVG_LENGTHTYPE_PT` (9)
  - : Giá trị được chỉ định bằng đơn vị `pt`.
- `SVG_LENGTHTYPE_PC` (10)
  - : Giá trị được chỉ định bằng đơn vị `pc`.

## Ví dụ

```xml
<svg height="200" onload="start();" version="1.1" width="200" xmlns="http://www.w3.org/2000/svg">
  <script><![CDATA[
function start() {
  const rect = document.getElementById("myRect");
  const val = rect.x.baseVal;

  // đọc x theo đơn vị pixel và cm
  console.log(
    `value: ${val.value}, valueInSpecifiedUnits: ${val.valueInSpecifiedUnits} (${val.unitType}), valueAsString: ${val.valueAsString}`,
  );

  // đặt x = 20pt và đọc theo đơn vị pixel và pt
  val.newValueSpecifiedUnits(SVGLength.SVG_LENGTHTYPE_PT, 20);
  console.log(
    `value: ${val.value}, valueInSpecifiedUnits: ${val.valueInSpecifiedUnits} (${val.unitType}), valueAsString: ${val.valueAsString}`,
  );

  // chuyển đổi x = 20pt sang inches và đọc theo đơn vị pixel và inch
  val.convertToSpecifiedUnits(SVGLength.SVG_LENGTHTYPE_IN);
  console.log(
    `value: ${val.value}, valueInSpecifiedUnits: ${val.valueInSpecifiedUnits} (${val.unitType}), valueAsString: ${val.valueAsString}`,
  );
}
]]></script>
  <rect id="myRect"
        x="1cm" y="1cm"
        fill="green" stroke="black" stroke-width="1"
        width="1cm" height="1cm"
  />
</svg>
```

Kết quả trên màn hình máy tính để bàn (đơn vị pixel phụ thuộc vào dpi):

```plain
value: 37.7952766418457, valueInSpecifiedUnits: 6: 1, valueAsString: 1cm
value: 26.66666603088379, valueInSpecifiedUnits 9: 20, valueAsString: 20pt
value: 26.66666603088379, valueInSpecifiedUnits 8: 0.277777761220932, valueAsString: 0.277778in
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
