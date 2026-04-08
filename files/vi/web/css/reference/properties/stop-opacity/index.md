---
title: stop-opacity
slug: Web/CSS/Reference/Properties/stop-opacity
page-type: css-property
browser-compat: css.properties.stop-opacity
sidebar: cssref
---

Thuộc tính **`stop-opacity`** của [CSS](/vi/docs/Web/CSS) xác định độ mờ đục của một điểm dừng màu gradient nhất định trong phần tử SVG {{SVGElement("stop")}} bên trong một gradient SVG. Nếu có, nó sẽ ghi đè thuộc tính {{SVGAttr("stop-opacity")}} của phần tử.

Giá trị thuộc tính ảnh hưởng đến kênh alpha của {{cssxref("stop-color")}}; nó có thể tăng độ trong suốt của màu `<stop>` nhưng không thể làm cho màu được xác định bởi thuộc tính `stop-color` trở nên đục hơn.

> [!NOTE]
> Thuộc tính `stop-opacity` chỉ áp dụng cho các phần tử {{SVGElement('stop')}} được lồng trong một {{SVGElement("svg")}}. Nó không áp dụng cho các SVG, HTML hay phần tử giả khác.

## Cú pháp

```css
/* Giá trị số và phần trăm */
stop-opacity: 0.2;
stop-opacity: 20%;

/* Giá trị toàn cục */
stop-opacity: inherit;
stop-opacity: initial;
stop-opacity: revert;
stop-opacity: revert-layer;
stop-opacity: unset;
```

### Giá trị

`<opacity-value>` là {{cssxref("number")}} hoặc {{cssxref("percentage")}} biểu thị độ mờ đục của phần tử `<stop>` gradient SVG.

- {{cssxref("number")}}
  - : Giá trị số trong khoảng từ `0` đến `1`, bao gồm cả hai đầu.

- {{cssxref("percentage")}}
  - : Giá trị phần trăm trong khoảng từ `0%` đến `100%`, bao gồm cả hai đầu.

Với giá trị `0` hoặc `0%`, điểm dừng hoàn toàn trong suốt. Với giá trị `1` hoặc `100%`, phần tử có độ mờ đục hoàn toàn của giá trị `stop-color`, vốn có thể có hoặc không có độ trong suốt một phần.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntaxRaw(`stop-opacity = <number> | <percentage>`)}}

## Ví dụ

### Xác định độ mờ đục của điểm dừng màu gradient SVG

Ví dụ này trình bày trường hợp sử dụng cơ bản của `stop-opacity`, và cách thuộc tính CSS `stop-opacity` được ưu tiên hơn thuộc tính `stop-opacity`.

#### HTML

Chúng ta có một SVG với một vài ngôi sao {{SVGElement("polygon")}} và ba phần tử {{SVGElement("linearGradient")}}: mỗi phần tử có ba phần tử {{SVGElement("stop")}} xác định ba điểm dừng màu tạo ra gradient từ xanh lam sang trắng rồi sang hồng; sự khác biệt duy nhất giữa chúng là giá trị `id`.

```html
<svg viewBox="0 0 250 120" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="myGradient1">
      <stop offset="5%" stop-color="#66ccff" stop-opacity="1" />
      <stop offset="50%" stop-color="#fefefe" stop-opacity="1" />
      <stop offset="95%" stop-color="#f4aab9" stop-opacity="1" />
    </linearGradient>
    <linearGradient id="myGradient2">
      <stop offset="5%" stop-color="#66ccff" stop-opacity="1" />
      <stop offset="50%" stop-color="#fefefe" stop-opacity="1" />
      <stop offset="95%" stop-color="#f4aab9" stop-opacity="1" />
    </linearGradient>
    <linearGradient id="myGradient3">
      <stop offset="5%" stop-color="#66ccff" stop-opacity="1" />
      <stop offset="50%" stop-color="#fefefe" stop-opacity="1" />
      <stop offset="95%" stop-color="#f4aab9" stop-opacity="1" />
    </linearGradient>
  </defs>
  <polygon points="40,10 10,100 80,40 0,40 70,100" />
  <polygon points="125,10 95,100 165,40 85,40 155,100" />
  <polygon points="210,10 180,100 250,40 170,40 240,100" />
</svg>
```

#### CSS

Chúng ta bao gồm {{cssxref("stroke")}} và {{cssxref("stroke-width")}} để làm cho đường viền đa giác hiển thị.

Mỗi `polygon` có nền gradient được thiết lập bằng thuộc tính {{cssxref("fill")}}; `id` của gradient là tham số `url()`. Chúng ta đặt `magenta` làm màu dự phòng.

Chúng ta xác định độ mờ đục của các điểm dừng của mỗi gradient bằng thuộc tính `stop-opacity`.

SVG có nền sọc để làm rõ hơn các cài đặt độ trong suốt.

```css hidden
svg {
  border: 1px solid;
  height: calc(100vh - 20px);
  margin-bottom: 10px;
  background: repeating-linear-gradient(
    to top left,
    white 0 9px,
    black 9px 10px
  );
}
```

```css
polygon {
  stroke: #333333;
  stroke-width: 1px;
}
polygon:nth-of-type(1) {
  fill: url("#myGradient1") magenta;
}
polygon:nth-of-type(2) {
  fill: url("#myGradient2") magenta;
}
polygon:nth-of-type(3) {
  fill: url("#myGradient3") magenta;
}

#myGradient1 stop {
  stop-opacity: 1;
}
#myGradient2 stop {
  stop-opacity: 0.8;
}
#myGradient3 stop {
  stop-opacity: 25%;
}
```

#### Kết quả

{{EmbedLiveSample("Defining the opacity of a SVG gradient color stop", "300", "200")}}

Ngôi sao đầu tiên hoàn toàn đục. Phần tô của ngôi sao thứ hai có độ mờ 80% vì các điểm dừng màu hơi trong suốt; `stop-opacity: 0.8;` đã ghi đè giá trị thuộc tính phần tử `stop-opacity="1"`. Phần tô của ngôi sao cuối cùng gần như không nhận ra với các điểm dừng màu chỉ có 25% độ mờ. Lưu ý đường viền vẫn là màu xám đậm đục trong tất cả các trường hợp.

> [!NOTE]
> Vì chúng ta sử dụng cùng giá trị `stop-opacity` cho tất cả các phần tử `<stop>` anh em trong gradient tuyến tính, chúng ta có thể thay vào đó sử dụng một `<linearGradient>` duy nhất với các điểm dừng hoàn toàn đục, và đặt giá trị cho thuộc tính {{cssxref("fill-opacity")}} của mỗi `<polygon>`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính SVG {{SVGAttr("stop-opacity")}}
- Thuộc tính trình bày: `stop-opacity`, {{cssxref("clip-rule")}}, {{cssxref("color-interpolation-filters")}}, {{cssxref("fill-opacity")}}, {{cssxref("fill-rule")}}, {{cssxref("fill")}}, {{cssxref("marker-end")}}, {{cssxref("marker-mid")}}, {{cssxref("marker-start")}}, {{cssxref("shape-rendering")}}, {{cssxref("stop-color")}}, {{cssxref("stroke")}}, {{cssxref("stroke-dasharray")}}, {{cssxref("stroke-dashoffset")}}, {{cssxref("stroke-linecap")}}, {{cssxref("stroke-linejoin")}}, {{cssxref("stroke-miterlimit")}}, {{cssxref("stroke-opacity")}}, {{cssxref("stroke-width")}}, {{cssxref("text-anchor")}}, và {{cssxref("vector-effect")}}
- {{cssxref("opacity")}}
- {{cssxref("background-color")}}
- {{cssxref("color_value", "&lt;color>")}}
- Kiểu dữ liệu {{cssxref("basic-shape")}}
