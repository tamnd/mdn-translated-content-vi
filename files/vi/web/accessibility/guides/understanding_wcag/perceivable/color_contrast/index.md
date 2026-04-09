---
title: Độ tương phản màu
slug: Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast
page-type: guide
sidebar: accessibilitysidebar
---

[Độ tương phản màu](https://w3c.github.io/wcag/guidelines/22/#dfn-contrast-ratio) giữa nội dung nền và nội dung tiền cảnh (thường là văn bản) nên đủ lớn để đảm bảo khả năng đọc.

Khi thiết kế giao diện dễ đọc cho các khả năng thị giác khác nhau, các hướng dẫn WCAG khuyến nghị các tỷ lệ tương phản sau:

| Loại nội dung                                                                                | Tỷ lệ tối thiểu (mức AA) | Tỷ lệ tăng cường (mức AAA) |
| -------------------------------------------------------------------------------------------- | ------------------------ | -------------------------- |
| Văn bản nội dung chính                                                                       | 4.5 : 1                  | 7 : 1                      |
| Văn bản cỡ lớn (lớn hơn 120-150% so với văn bản nội dung chính)                              | 3 : 1                    | 4.5 : 1                    |
| Thành phần giao diện người dùng đang hoạt động và đối tượng đồ họa như biểu tượng và biểu đồ | 3 : 1                    | Không xác định             |

Các tỷ lệ này không áp dụng cho văn bản "phụ", chẳng hạn như điều khiển không hoạt động, logo, hoặc văn bản chỉ mang tính trang trí.

Xem phần [Giải pháp](#solution) bên dưới để biết thêm thông tin.

Độ tương phản màu tốt trên trang web của bạn có lợi cho tất cả người dùng, nhưng đặc biệt hữu ích cho người dùng bị một số dạng mù màu và các tình trạng tương tự, vốn gặp tương phản thấp và khó phân biệt các màu gần giống nhau. Lý do là họ không nhận ra vùng sáng và vùng tối rõ như những người không mắc các tình trạng này, nên gặp khó khăn khi nhìn thấy cạnh, đường viền, và các chi tiết khác.

Thiết kế đẹp là điều tốt cho website của bạn, nhưng thiết kế đó vô nghĩa nếu người dùng không đọc được nội dung.

## Ví dụ

Hãy cùng xem một số mã HTML và CSS:

```html
<div class="good">Good contrast</div>
<div class="bad">Bad contrast</div>
```

```css
div {
  /* General div styles here */
}

.good {
  background-color: #5a80a9;
}

.bad {
  background-color: #400064;
}
```

Cả hai đoạn văn bản đều có màu đen mặc định.

### Độ tương phản tốt

`<div>` "good" có nền xanh neon, giúp văn bản dễ đọc:

```html
<div class="good">Good contrast</div>
```

```css
div {
  font-family: sans-serif;
  text-align: center;
  font-size: 2rem;
  font-weight: bold;
  width: 250px;
  padding: 30px;
  border-radius: 20px;
  box-shadow: 4px 4px 4px black;
}

.good {
  background-color: #5a80a9;
}
```

{{EmbedLiveSample('Good_Contrast', '100%', '100')}}

### Độ tương phản kém

Mặt khác, `<div>` "bad" có nền tím rất đậm, khiến văn bản khó đọc hơn nhiều:

```html
<div class="bad">Bad contrast</div>
```

```css
div {
  font-family: sans-serif;
  text-align: center;
  font-size: 2rem;
  font-weight: bold;
  width: 250px;
  padding: 30px;
  border-radius: 20px;
  box-shadow: 4px 4px 4px black;
}

.bad {
  background-color: #400064;
}
```

{{EmbedLiveSample('Bad_Contrast', '100%', '100')}}

## Giải pháp

Khi chọn bảng màu cho website, hãy chọn màu tiền cảnh và màu nền có độ tương phản tốt. Hãy làm cho độ tương phản màu tốt nhất có thể trong giới hạn thiết kế của bạn - lý tưởng nhất là nhắm đến mức AAA (xem 1.4.6 bên dưới), nhưng ít nhất phải đạt mức AA (xem 1.4.3 bên dưới).

Nếu bạn có nội dung không phải văn bản như video hoặc hoạt ảnh, bạn nên tuân theo 1.4.11 (xem bên dưới).

Để kiểm tra độ tương phản khi bạn lựa chọn màu, hãy dùng công cụ như [Color Contrast Checker](https://webaim.org/resources/contrastchecker/) của WebAIM.

Bạn cũng có thể kiểm tra độ tương phản màu ngay trong lúc làm việc bằng Firefox Developer Tools - xem hướng dẫn [Accessibility inspector](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/index.html), đặc biệt là phần [Check for accessibility issues](https://firefox-source-docs.mozilla.org/devtools-user/accessibility_inspector/index.html#check-for-accessibility-issues). Hãy thử dùng nó trên các ví dụ trực tiếp trong phần mô tả.

## Các tiêu chí thành công WCAG liên quan

- [1.4.3 Minimum contrast (AA)](https://w3c.github.io/wcag/guidelines/22/#contrast-minimum)
  - : Độ tương phản màu giữa nội dung nền và nội dung tiền cảnh nên đạt mức tối thiểu để đảm bảo khả năng đọc:
    - Văn bản và nền của nó nên có tỷ lệ tương phản ít nhất 4.5:1.
    - Văn bản tiêu đề (hoặc chỉ văn bản lớn hơn) nên có tỷ lệ ít nhất 3:1. Văn bản lớn được định nghĩa là ít nhất 18pt, hoặc 14pt in đậm.

- [1.4.6 Enhanced contrast (AAA)](https://w3c.github.io/wcag/guidelines/22/#contrast-enhanced)
  - : Tiêu chí này tiếp nối và mở rộng tiêu chí 1.4.3.
    - Văn bản và nền của nó nên có tỷ lệ tương phản ít nhất 7:1.
    - Văn bản tiêu đề (hoặc chỉ văn bản lớn hơn) nên có tỷ lệ ít nhất 4.5:1.

- [1.4.11 Non-Text Contrast (AA)](https://w3c.github.io/wcag/guidelines/22/#non-text-contrast)
  - : Nên có tỷ lệ tương phản màu tối thiểu 3:1 cho các thành phần giao diện người dùng và các đối tượng đồ họa.

## Xem thêm

- [Màu sắc và độ tương phản màu](/en-US/docs/Learn_web_development/Core/Accessibility/CSS_and_JavaScript#color_and_color_contrast)
- [Nhiều nhãn](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_structure_a_web_form#multiple_labels)
- [Hiểu về Non-Text Contrast](https://www.w3.org/WAI/WCAG21/Understanding/non-text-contrast.html)
