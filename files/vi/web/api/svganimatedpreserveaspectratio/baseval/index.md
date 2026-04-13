---
title: "SVGAnimatedPreserveAspectRatio: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedPreserveAspectRatio/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedPreserveAspectRatio.baseVal
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`baseVal`** của giao diện {{domxref("SVGAnimatedPreserveAspectRatio")}} đại diện cho giá trị cơ sở (không hoạt hình) của thuộc tính {{SVGAttr("preserveAspectRatio")}} của phần tử SVG.

## Giá trị

Một đối tượng {{domxref("SVGPreserveAspectRatio")}}.

## Ví dụ

Xem xét SVG sau:

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <image
    id="myImage"
    href="crows.jpg"
    width="50"
    height="50"
    preserveAspectRatio="xMinYMin meet">
    <animate
      attributeName="preserveAspectRatio"
      from="xMinYMin meet"
      to="xMaxYMax slice"
      dur="5s"
      fill="freeze"
      repeatCount="1" />
  </image>
</svg>
```

Ví dụ này định nghĩa một phần tử `<image>` hoạt hình thuộc tính `preserveAspectRatio`. Hoạt hình chạy một lần và đặt thuộc tính `fill` thành `"freeze"`, do đó hiệu ứng của hoạt hình được duy trì sau khi hoạt hình kết thúc.

Chúng ta chạy đoạn code sau ngay khi trang tải:

```js
const image = document.querySelector("#myImage");
const baseVal = image.preserveAspectRatio.baseVal;
const animVal = image.preserveAspectRatio.animVal;

console.log(baseVal.meetOrSlice); // Đầu ra: 1 (SVG_MEETORSLICE_MEET)
console.log(animVal.meetOrSlice); // Đầu ra: 1 (SVG_MEETORSLICE_MEET)
```

Nếu chúng ta ghi lại các giá trị của `animVal.meetOrSlice` và `baseVal.meetOrSlice` sau khi hoạt hình kết thúc, chúng ta sẽ thấy điều sau:

```js
console.log(baseVal.meetOrSlice); // Đầu ra: 1 (SVG_MEETORSLICE_MEET)
console.log(animVal.meetOrSlice); // Đầu ra: 2 (SVG_MEETORSLICE_SLICE)
```

Lưu ý rằng nếu chúng ta đặt `fill` thành `"remove"` (hoặc xóa `fill` hoàn toàn, vì `"remove"` là mặc định) thì các hiệu ứng hoạt hình sẽ bị xóa khi hoạt hình hoàn tất, và `animVal.meetOrSlice` sẽ quay lại `1`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGPreserveAspectRatio")}}
- {{domxref("SVGElement")}}
