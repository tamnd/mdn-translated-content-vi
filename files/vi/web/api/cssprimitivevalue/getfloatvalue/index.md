---
title: "CSSPrimitiveValue: getFloatValue() method"
short-title: getFloatValue()
slug: Web/API/CSSPrimitiveValue/getFloatValue
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.CSSPrimitiveValue.getFloatValue
---

{{APIRef("CSSOM")}}{{deprecated_header}}

Phương thức **`getFloatValue()`** của giao diện {{domxref("CSSPrimitiveValue")}} dùng để lấy giá trị float theo đơn vị đã chỉ định. Nếu giá trị CSS này không chứa giá trị float hoặc không thể chuyển đổi sang đơn vị đã chỉ định, một {{domxref("DOMException")}} sẽ được ném ra.

> [!NOTE]
> Phương thức này là một phần của nỗ lực tạo ra CSS Object Model có kiểu. Nỗ lực này đã bị từ bỏ và hầu hết các trình duyệt không triển khai nó.
>
> Để đạt được mục đích của bạn, bạn có thể sử dụng:
>
> - [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) không có kiểu, được hỗ trợ rộng rãi, hoặc
> - [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại, ít được hỗ trợ hơn và được coi là thử nghiệm.

## Cú pháp

```js-nolint
getFloatValue(unit)
```

### Tham số

- `unit`
  - : Một `unsigned short` đại diện cho mã kiểu đơn vị, theo đó giá trị sẽ được trả về. Các giá trị hợp lệ là:

    | Hằng số          | Mô tả                                                                                                           |
    | ---------------- | --------------------------------------------------------------------------------------------------------------- |
    | `CSS_CM`         | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng centimet.                                                    |
    | `CSS_DEG`        | Giá trị là {{cssxref("&lt;angle&gt;")}} tính bằng độ.                                                           |
    | `CSS_DIMENSION`  | Giá trị là {{cssxref("&lt;number&gt;")}} với kích thước không xác định.                                         |
    | `CSS_EMS`        | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng đơn vị em.                                                   |
    | `CSS_EXS`        | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng đơn vị ex.                                                   |
    | `CSS_GRAD`       | Giá trị là {{cssxref("&lt;angle&gt;")}} tính bằng grad.                                                         |
    | `CSS_HZ`         | Giá trị là {{cssxref("&lt;frequency&gt;")}} tính bằng Hertz. Giá trị có thể lấy bằng phương thức getFloatValue. |
    | `CSS_IN`         | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng inch.                                                        |
    | `CSS_KHZ`        | Giá trị là {{cssxref("&lt;frequency&gt;")}} tính bằng Kilohertz.                                                |
    | `CSS_MM`         | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng milimet.                                                     |
    | `CSS_MS`         | Giá trị là {{cssxref("&lt;time&gt;")}} tính bằng miligiây.                                                      |
    | `CSS_NUMBER`     | Giá trị là {{cssxref("&lt;number&gt;")}} đơn giản.                                                              |
    | `CSS_PC`         | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng pica.                                                        |
    | `CSS_PERCENTAGE` | Giá trị là {{cssxref("&lt;percentage&gt;")}}.                                                                   |
    | `CSS_PT`         | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng điểm.                                                        |
    | `CSS_PX`         | Giá trị là {{cssxref("&lt;length&gt;")}} tính bằng pixel.                                                       |
    | `CSS_RAD`        | Giá trị là {{cssxref("&lt;angle&gt;")}} tính bằng radian.                                                       |
    | `CSS_S`          | Giá trị là {{cssxref("&lt;time&gt;")}} tính bằng giây.                                                          |

### Giá trị trả về

Giá trị `float` theo đơn vị đã chỉ định.

### Ngoại lệ

<table class="no-markdown">
  <thead>
    <tr>
      <th scope="col"><strong>Kiểu</strong></th>
      <th scope="col"><strong>Mô tả</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>DOMException</code></td>
      <td>
        Một <code>INVALID_ACCESS_ERR</code> được ném ra nếu giá trị CSS không
        chứa giá trị float hoặc giá trị float không thể chuyển đổi sang
        đơn vị đã chỉ định.
      </td>
    </tr>
  </tbody>
</table>

## Ví dụ

```js
const cs = window.getComputedStyle(document.body);
const cssValue = cs.getPropertyCSSValue("margin-top");
console.log(cssValue.getFloatValue(CSSPrimitiveValue.CSS_CM));
```

## Thông số kỹ thuật

Tính năng này ban đầu được định nghĩa trong đặc tả [DOM Style Level 2](https://www.w3.org/TR/DOM-Level-2-Style/), nhưng kể từ đó đã bị loại bỏ khỏi mọi nỗ lực chuẩn hóa.

Nó đã được thay thế bởi một [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API) hiện đại nhưng không tương thích, hiện đang trong lộ trình chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}
