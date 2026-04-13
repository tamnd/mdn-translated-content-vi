---
title: "CSSPrimitiveValue: primitiveType property"
short-title: primitiveType
slug: Web/API/CSSPrimitiveValue/primitiveType
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.CSSPrimitiveValue.primitiveType
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Thuộc tính chỉ đọc **`primitiveType`** của giao diện {{domxref("CSSPrimitiveValue")}} đại diện cho kiểu của giá trị CSS.

> [!NOTE]
> Thuộc tính này là một phần của nỗ lực tạo ra CSS Object Model có kiểu. Nỗ lực này đã bị từ bỏ và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Giá trị

Một `unsigned short` đại diện cho kiểu của giá trị. Các giá trị có thể là:

<table class="no-markdown">
  <thead>
    <tr>
      <th>Hằng số</th>
      <th>Mô tả</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>CSS_ATTR</code></td>
      <td>
        Giá trị là hàm {{cssxref("attr", "attr()")}}. Giá trị có thể
        lấy bằng phương thức <code>getStringValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_CM</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng centimet.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_COUNTER</code></td>
      <td>
        Giá trị là hàm
        <a href="/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters">counter hoặc counters</a>.
        Giá trị có thể lấy bằng phương thức <code>getCounterValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_DEG</code></td>
      <td>
        Giá trị là {{cssxref("&lt;angle&gt;")}} tính bằng độ. Giá trị
        có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_DIMENSION</code></td>
      <td>
        Giá trị là {{cssxref("&lt;number&gt;")}} với kích thước không xác định.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_EMS</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng đơn vị em.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_EXS</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng đơn vị ex.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_GRAD</code></td>
      <td>
        Giá trị là {{cssxref("&lt;angle&gt;")}} tính bằng grad. Giá trị
        có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_HZ</code></td>
      <td>
        Giá trị là {{cssxref("&lt;frequency&gt;")}} tính bằng Hertz.
        Giá trị có thể lấy bằng phương thức getFloatValue.
      </td>
    </tr>
    <tr>
      <td><code>CSS_IDENT</code></td>
      <td>
        Giá trị là một định danh. Giá trị có thể lấy bằng phương thức
        <code>getStringValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_IN</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng inch.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_KHZ</code></td>
      <td>
        Giá trị là {{cssxref("&lt;frequency&gt;")}} tính bằng Kilohertz.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_MM</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng milimet.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_MS</code></td>
      <td>
        Giá trị là {{cssxref("&lt;time&gt;")}} tính bằng miligiây.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_NUMBER</code></td>
      <td>
        Giá trị là {{cssxref("&lt;number&gt;")}} đơn giản.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_PC</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng pica.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_PERCENTAGE</code></td>
      <td>
        Giá trị là {{cssxref("&lt;percentage&gt;")}}. Giá trị
        có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_PT</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng điểm.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_PX</code></td>
      <td>
        Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng pixel.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_RAD</code></td>
      <td>
        Giá trị là {{cssxref("&lt;angle&gt;")}} tính bằng radian.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_RECT</code></td>
      <td>
        Giá trị là hàm {{cssxref("shape", "rect()", "#Syntax")}}.
        Giá trị có thể lấy bằng phương thức <code>getRectValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_RGBCOLOR</code></td>
      <td>
        Giá trị là {{cssxref("&lt;color&gt;")}}. Giá trị có thể
        lấy bằng phương thức <code>getRGBColorValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_S</code></td>
      <td>
        Giá trị là {{cssxref("&lt;time&gt;")}} tính bằng giây.
        Giá trị có thể lấy bằng phương thức <code>getFloatValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_STRING</code></td>
      <td>
        Giá trị là {{cssxref("&lt;string&gt;")}}. Giá trị có thể
        lấy bằng phương thức <code>getStringValue()</code>.
      </td>
    </tr>
    <tr>
      <td><code>CSS_UNKNOWN</code></td>
      <td>
        Giá trị không phải là giá trị CSS2 được nhận dạng. Giá trị chỉ có thể lấy
        bằng thuộc tính {{domxref("CSSValue.cssText", "cssText")}}.
      </td>
    </tr>
    <tr>
      <td><code>CSS_URI</code></td>
      <td>
        Giá trị là {{cssxref("url_value", "&lt;url&gt;")}}. Giá trị có thể lấy
        bằng phương thức <code>getStringValue()</code>.
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

```js
const cs = window.getComputedStyle(document.body);
const cssValue = cs.getPropertyCSSValue("color");
console.log(cssValue.primitiveType);
```

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng kể từ đó đã bị loại bỏ khỏi mọi nỗ lực chuẩn hóa.

Nó đã được thay thế bởi một [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại nhưng không tương thích, hiện đang trong lộ trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CSSStyleDeclaration.getPropertyCSSValue()")}}
