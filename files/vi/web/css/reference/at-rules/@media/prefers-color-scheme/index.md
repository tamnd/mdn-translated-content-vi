---
title: prefers-color-scheme
slug: Web/CSS/Reference/At-rules/@media/prefers-color-scheme
page-type: css-media-feature
browser-compat: css.at-rules.media.prefers-color-scheme
sidebar: cssref
---

Đặc trưng media CSS **`prefers-color-scheme`** được dùng để phát hiện xem người dùng đã yêu cầu giao diện màu sáng hay tối.
Người dùng chỉ định sở thích của họ thông qua cài đặt hệ điều hành (ví dụ: chế độ sáng hoặc tối) hoặc cài đặt tác nhân người dùng.

## Phần tử nhúng

Đối với SVG và iframe, `prefers-color-scheme` cho phép bạn đặt kiểu CSS cho SVG hoặc iframe dựa trên {{cssxref("color-scheme")}} của phần tử cha trong trang web.
Các SVG phải được dùng dưới dạng nhúng (tức là `<img src="circle.svg" alt="circle" />`) thay vì [nhúng trực tiếp vào HTML](/en-US/docs/Web/SVG/Guides/SVG_in_HTML#basic_example).
Ví dụ về việc dùng `prefers-color-scheme` trong SVG có thể tìm thấy trong phần ["Kế thừa bảng màu trong các phần tử nhúng"](#inherited_color_scheme_in_embedded_elements).

Việc sử dụng `prefers-color-scheme` được cho phép trong các phần tử `<svg>` và `<iframe>` [cross-origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy#cross-origin_network_access). Các phần tử cross-origin là các phần tử được lấy từ một máy chủ khác với trang đang tham chiếu chúng.
Để tìm hiểu thêm về SVG, xem [tài liệu SVG](/en-US/docs/Web/SVG) và để biết thêm thông tin về iframe, xem [tài liệu iframe](/en-US/docs/Web/HTML/Reference/Elements/iframe).

## Cú pháp

- `light`
  - : Cho biết người dùng đã thông báo rằng họ thích giao diện có chủ đề sáng, hoặc chưa bày tỏ sở thích tích cực nào.
- `dark`
  - : Cho biết người dùng đã thông báo rằng họ thích giao diện có chủ đề tối.

## Ví dụ

### Phát hiện giao diện tối hay sáng

Cách dùng phổ biến là sử dụng bảng màu sáng theo mặc định, rồi dùng `prefers-color-scheme: dark` để ghi đè màu thành biến thể tối hơn. Cũng có thể làm ngược lại.

Ví dụ này thể hiện cả hai tùy chọn: Giao diện A sử dụng màu sáng, nhưng có thể được ghi đè thành màu tối. Giao diện B sử dụng màu tối, nhưng có thể được ghi đè thành màu sáng. Cuối cùng, nếu trình duyệt hỗ trợ `prefers-color-scheme`, cả hai giao diện sẽ là sáng hoặc tối.

#### HTML

```html
<div class="box theme-a">Theme A (initial)</div>
<div class="box theme-a adaptive">Theme A (changed if dark preferred)</div>
<br />

<div class="box theme-b">Theme B (initial)</div>
<div class="box theme-b adaptive">Theme B (changed if light preferred)</div>
```

#### CSS

```css hidden
div.box {
  display: inline-block;
  padding: 1em;
  margin: 6px;
  outline: 2px solid black;
  width: 12em;
  height: 2em;
  vertical-align: middle;
}
```

Giao diện A (màu nâu) sử dụng bảng màu sáng theo mặc định, nhưng sẽ chuyển sang bảng màu tối dựa trên media query:

```css
.theme-a {
  background: #ddccaa;
  color: #773311;
}
@media (prefers-color-scheme: dark) {
  .theme-a.adaptive {
    background: #775533;
    color: #ddccbb;
    outline: 5px dashed black;
  }
}
```

Giao diện B (màu xanh) sử dụng bảng màu tối theo mặc định, nhưng sẽ chuyển sang bảng màu sáng dựa trên media query:

```css
.theme-b {
  background: #444477;
  color: #bbbbdd;
}
@media (prefers-color-scheme: light) {
  .theme-b.adaptive {
    background: #bbccdd;
    color: #333344;
    outline: 5px dotted black;
  }
}
```

#### Kết quả

Các hộp bên trái hiển thị Giao diện A và Giao diện B như thể không có media query `prefers-color-scheme`. Các hộp bên phải hiển thị các giao diện tương tự, nhưng một trong số chúng sẽ được thay đổi thành biến thể tối hoặc sáng hơn dựa trên bảng màu đang hoạt động của người dùng. Đường viền của một hộp sẽ là nét đứt hoặc nét chấm nếu nó được thay đổi dựa trên cài đặt trình duyệt hoặc hệ điều hành của bạn.

{{EmbedLiveSample("Detecting_a_dark_or_light_theme", "100%", "200px")}}

### Kế thừa bảng màu trong các phần tử nhúng

Ví dụ sau đây cho thấy cách dùng đặc trưng media `prefers-color-scheme` trong một phần tử nhúng để kế thừa bảng màu từ phần tử cha.
Một script được dùng để đặt nguồn của các phần tử `<img>` và thuộc tính `alt` của chúng. Thông thường điều này được thực hiện trong HTML như `<img src="circle.svg" alt="circle" />`.

Bạn sẽ thấy ba vòng tròn, trong đó một cái được vẽ bằng màu khác.
Vòng tròn đầu tiên kế thừa `color-scheme` từ hệ điều hành và có thể được chuyển đổi bằng công cụ chuyển chủ đề của hệ thống.

Vòng tròn thứ hai và thứ ba kế thừa `color-scheme` từ phần tử nhúng; truy vấn `@media` cho phép đặt kiểu cho nội dung SVG dựa trên `color-scheme` của phần tử cha.
Trong trường hợp này, phần tử cha có thuộc tính CSS `color-scheme` là một `<div>`.

```html
<div>
  <img alt="circle" src="" />
</div>
<div class="light">
  <img alt="circle" src="" />
</div>
<div class="dark">
  <img alt="circle" src="" />
</div>
```

```css
.light {
  color-scheme: light;
}

.dark {
  color-scheme: dark;
}
```

```js
// Embed an SVG for all <img> elements
for (const img of document.querySelectorAll("img")) {
  img.src = `data:image/svg+xml;base64,${window.btoa(`
    <svg width="32" height="32" viewBox="0 0 32 32" xmlns="http://www.w3.org/2000/svg">
      <style>
        :root { color: blue }
        @media (prefers-color-scheme: dark) {
          :root { color: purple }
        }
      </style>
      <circle fill="currentColor" cx="16" cy="16" r="16"/>
    </svg>
  `)}`;
}
```

{{EmbedLiveSample("Color_scheme_inheritance")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("color-scheme")}}
- [`<meta name="color-scheme">`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/color-scheme)
- HTTP Header {{HTTPHeader("Sec-CH-Prefers-Color-Scheme")}} [User Agent Client Hint](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints)
- [Mô phỏng prefers-color-scheme trong Firefox](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/examine_and_edit_css/index.html#view-media-rules-for-prefers-color-scheme)
- [Video: Lập trình chế độ tối cho trang web của bạn](https://www.youtube.com/watch?v=jmepqJ5UbuM)
- [Thiết kế lại sản phẩm và trang web của bạn cho chế độ tối](https://stuffandnonsense.co.uk/blog/redesigning-your-product-and-website-for-dark-mode)
- Thay đổi bảng màu trên [Windows](https://blogs.windows.com/windowsexperience/2019/04/01/windows-10-tip-dark-theme-in-file-explorer/), [macOS](https://developer.apple.com/design/human-interface-guidelines/dark-mode), [Android](https://www.theverge.com/2019/5/7/18530599/google-android-q-features-hands-on-dark-mode-gestures-accessibility-io-2019), hoặc [các nền tảng khác](https://support.mozilla.org/en-US/questions/1271928).
