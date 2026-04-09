---
title: Thuộc tính toàn cục HTML autocapitalize
short-title: autocapitalize
slug: Web/HTML/Reference/Global_attributes/autocapitalize
page-type: html-attribute
browser-compat: html.global_attributes.autocapitalize
sidebar: htmlsidebar
---

Thuộc tính toàn cục **`autocapitalize`** [global attribute](/en-US/docs/Web/HTML/Reference/Global_attributes) là thuộc tính [enumerated](/en-US/docs/Glossary/Enumerated) kiểm soát liệu văn bản được nhập có tự động viết hoa hay không và nếu có thì theo cách nào. Điều này liên quan đến:

- Các phần tử {{htmlelement("input")}} và {{htmlelement("textarea")}}.
- Bất kỳ phần tử nào có [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được đặt trên nó.

`autocapitalize` không ảnh hưởng đến hành vi khi gõ trên bàn phím vật lý. Nó ảnh hưởng đến hành vi của các cơ chế nhập khác như bàn phím ảo trên thiết bị di động và nhập bằng giọng nói. Điều này có thể hỗ trợ người dùng bằng cách làm cho việc nhập dữ liệu nhanh hơn và dễ hơn, ví dụ bằng cách tự động viết hoa chữ cái đầu tiên của mỗi câu.

## Giá trị

Các giá trị có thể là:

- `none` hoặc `off`
  - : Không tự động viết hoa bất kỳ văn bản nào.
- `sentences` hoặc `on`
  - : Tự động viết hoa ký tự đầu tiên của mỗi câu.
- `words`
  - : Tự động viết hoa ký tự đầu tiên của mỗi từ.
- `characters`
  - : Tự động viết hoa mọi ký tự.

## Ghi chú sử dụng

- `autocapitalize` có thể được đặt trên các phần tử `<input>` và `<textarea>`, _và_ trên các phần tử {{htmlelement("form")}} chứa chúng. Khi `autocapitalize` được đặt trên phần tử `<form>`, nó đặt hành vi autocapitalize cho tất cả các `<input>` và `<textarea>` bên trong, ghi đè bất kỳ giá trị `autocapitalize` nào được đặt trên các phần tử bên trong.
- `autocapitalize` không có hiệu lực trên các loại `<input>` là `url`, `email`, hoặc `password`, nơi mà autocapitalization không bao giờ được bật.
- Khi `autocapitalize` không được chỉ định, hành vi mặc định được áp dụng khác nhau giữa các trình duyệt. Ví dụ:
  - Chrome và Safari mặc định là `on`/`sentences`
  - Firefox mặc định là `off`/`none`.

## Ví dụ

### HTML

```html
<p>Form to test different autocapitalize settings:</p>

<form>
  <div>
    <label for="default">Default: no autocapitalize set</label>
    <input type="text" id="default" name="default" />
  </div>
  <div>
    <label for="off">autocapitalize="off"</label>
    <input type="text" id="off" name="off" autocapitalize="off" />
  </div>
  <div>
    <label for="none">autocapitalize="none"</label>
    <input type="text" id="none" name="none" autocapitalize="none" />
  </div>
  <div>
    <label for="on">autocapitalize="on"</label>
    <input type="text" id="on" name="on" autocapitalize="on" />
  </div>
  <div>
    <label for="sentences">autocapitalize="sentences"</label>
    <input
      type="text"
      id="sentences"
      name="sentences"
      autocapitalize="sentences" />
  </div>
  <div>
    <label for="words">autocapitalize="words"</label>
    <input type="text" id="words" name="words" autocapitalize="words" />
  </div>
  <div>
    <label for="characters">autocapitalize="characters"</label>
    <input
      type="text"
      id="characters"
      name="characters"
      autocapitalize="characters" />
  </div>
  <div>
    <label for="characters-ta">autocapitalize="characters" on textarea</label>
    <textarea
      type="text"
      id="characters-ta"
      name="characters-ta"
      autocapitalize="characters">
    </textarea>
  </div>
</form>

<hr />

<p contenteditable autocapitalize="characters">
  This content is editable and has autocapitalize="characters" set on it
</p>
```

```css hidden
div {
  margin-bottom: 20px;
}
```

## Kết quả

Kiểm tra hiệu lực trên mỗi trường nhập bằng bàn phím ảo hoặc nhập bằng giọng nói (nhập bàn phím sẽ không hoạt động).

{{ EmbedLiveSample("Examples", "100%", "500") }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
