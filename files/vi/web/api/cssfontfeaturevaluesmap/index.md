---
title: CSSFontFeatureValuesMap
slug: Web/API/CSSFontFeatureValuesMap
page-type: web-api-interface
status:
  - experimental
browser-compat: api.CSSFontFeatureValuesMap
---

{{APIRef("CSSOM")}}{{SeeCompatTable}}

Giao diện **`CSSFontFeatureValuesMap`** của [CSS Object Model (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho một tập hợp có thể lặp và chỉ đọc các thuộc tính của [CSSFontFeatureValuesRule](/en-US/docs/Web/API/CSSFontFeatureValuesRule), chẳng hạn như [`swash`](/en-US/docs/Web/API/CSSFontFeatureValuesRule/swash), [`annotation`](/en-US/docs/Web/API/CSSFontFeatureValuesRule/annotation), [`ornaments`](/en-US/docs/Web/API/CSSFontFeatureValuesRule/ornaments), v.v.

Một thực thể `CSSFontFeatureValuesMap` là một [đối tượng giống Map](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Map#map-like_browser_apis) chỉ đọc, trong đó mỗi khóa là tên do người dùng định nghĩa để tham chiếu đến một tính năng phông chữ, và giá trị tương ứng là chỉ mục của tính năng phông chữ trong phông.

## Thuộc tính phiên bản

- {{domxref('CSSFontFeatureValuesMap.size')}} {{experimental_inline}}
  - : Trả về một số nguyên dương chứa kích thước của đối tượng `CSSFontFeatureValuesMap`.

## Phương thức phiên bản

- {{domxref('CSSFontFeatureValuesMap.clear()')}} {{experimental_inline}}
  - : Xóa tất cả các khai báo trong `CSSFontFeatureValuesMap`.
- {{domxref('CSSFontFeatureValuesMap.delete()')}} {{experimental_inline}}
  - : Xóa khai báo CSS có thuộc tính được chỉ định trong `CSSFontFeatureValuesMap`.
- {{domxref('CSSFontFeatureValuesMap.entries()')}} {{experimental_inline}}
  - : Trả về một đối tượng [map iterator](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator) mới chứa các cặp `[key, value]` cho mỗi khai báo trong `CSSFontFeatureValuesMap` này theo thứ tự chèn.
- {{domxref('CSSFontFeatureValuesMap.forEach()')}} {{experimental_inline}}
  - : Thực thi một hàm được cung cấp một lần cho mỗi cặp khóa/giá trị trong `CSSFontFeatureValuesMap` này theo thứ tự chèn.
- {{domxref('CSSFontFeatureValuesMap.get()')}} {{experimental_inline}}
  - : Trả về giá trị tương ứng với khóa trong `CSSFontFeatureValuesMap` này, hoặc `undefined` nếu không có.
- {{domxref('CSSFontFeatureValuesMap.has()')}} {{experimental_inline}}
  - : Trả về một giá trị boolean cho biết liệu có mục nào với khóa được chỉ định tồn tại trong `CSSFontFeatureValuesMap` này hay không.
- {{domxref('CSSFontFeatureValuesMap.keys()')}} {{experimental_inline}}
  - : Trả về một đối tượng [map iterator](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator) mới chứa `key` cho mỗi khai báo trong `CSSFontFeatureValuesMap` này theo thứ tự chèn.
- {{domxref('CSSFontFeatureValuesMap.set()')}} {{experimental_inline}}
  - : Thêm một mục mới với khóa và giá trị được chỉ định vào `CSSFontFeatureValuesMap` này, hoặc cập nhật mục hiện có nếu khóa đã tồn tại.
- {{domxref('CSSFontFeatureValuesMap.values()')}} {{experimental_inline}}
  - : Trả về một đối tượng [map iterator](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator) mới chứa `value` cho mỗi khai báo trong `CSSFontFeatureValuesMap` này theo thứ tự chèn.
- [`CSSFontFeatureValuesMap.[Symbol.iterator]()`](/en-US/docs/Web/API/CSSFontFeatureValuesMap/Symbol.iterator)
  - : Trả về chính đối tượng iterator. Điều này cho phép các đối tượng iterator cũng có thể được lặp.

## Ví dụ

### Ghi lại các tên do người dùng định nghĩa

Ví dụ này cho thấy cách bạn có thể ghi lại các tên do người dùng định nghĩa (và chỉ mục ánh xạ của chúng) được lưu trữ trong một `CSSFontFeatureValuesMap` (cho các thuộc tính `CSSFontFeatureValuesRule` cụ thể).

#### CSS

Đầu tiên chúng ta khai báo {{cssxref("@font-feature-values")}} cho họ phông _Font One_. Điều này bao gồm việc khai báo các tên "nice-style" và "odd-style" có thể được sử dụng để đại diện cho các ký tự thay thế `styleset` cho _Font One_ và chỉ định các giá trị chỉ mục cho những ký tự đó. Nó cũng bao gồm khai báo tên "swishy" có thể được sử dụng để đại diện cho các ký tự thay thế `swash` cho _Font One_ và chỉ định chỉ mục cho ký tự thay thế đó.

Các ký tự thay thế "nice-style" sau đó được áp dụng cho bất kỳ lớp `.nice-look` nào, sử dụng thuộc tính {{CSSXRef("font-variant-alternates")}} và truyền tên vào hàm [`styleset()`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-alternates#styleset). Tương tự cũng được thực hiện với tên "swishy" cho các ký tự thay thế `swash`, sau đó được truyền vào hàm [`swash()`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-alternates#swash). Các ký tự "odd-style" không được sử dụng (chúng chỉ được thêm vào để minh họa rằng nhiều giá trị có thể được định nghĩa trong map).

```css
/* Quy tắc At-rule cho "nice-style", "odd-style", và "swishy" trong Font One */
@font-feature-values Font One {
  @styleset {
    nice-style: 12; /* tên đại diện cho tập ký tự thay thế ở chỉ mục 12 */
    odd-style: 10; /* tên đại diện cho tập ký tự thay thế ở chỉ mục 10 */
  }
  @swash {
    swishy: 1; /* tên đại diện cho tập ký tự thay thế ở chỉ mục 1 */
  }
}

/* Áp dụng các at-rule cho các bộ chọn thích hợp */
.nice-look {
  font-variant-alternates: styleset(nice-style);
}
.swoosh {
  font-variant-alternates: swash(swishy);
}
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

Đoạn mã dưới đây tìm `CSSFontFeatureValuesRule` tương ứng với quy tắc `@font-feature-values` CSS được thêm ở trên. Sau đó, nó lặp qua các giá trị của thuộc tính `styleset` và `swash`, được biểu diễn bởi các thực thể `CSSFontFeatureValuesMap`, sử dụng phương thức [`forEach()`](/en-US/docs/Web/API/CSSFontFeatureValuesMap/forEach). Ở mỗi bước, nó ghi lại các tên do người dùng định nghĩa và giá trị chỉ mục.

```js
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const rules = document.querySelector("#css-output").sheet.cssRules;
const fontOne = rules[0]; // Một CSSFontFeatureValuesRule
if (fontOne.styleset) {
  // Thuộc tính styleset được hỗ trợ
  log(
    "The user has defined the following name(s)/index(s) for CSSFontFeatureValuesRule.styleset:",
  );
  fontOne.styleset.forEach((value, key) => log(` ${key} : ${value}`));
} else {
  log("Browser does not support CSSFontFeatureValuesMap.styleset property.");
}

if (fontOne.swash) {
  log(
    "The user has defined the following name(s)/index(s) for CSSFontFeatureValuesRule.swash:",
  );
  fontOne.swash.forEach((value, key) => log(` ${key} : ${value}`));
} else {
  log("Browser does not support CSSFontFeatureValuesMap.swash property.");
}
```

#### Kết quả

{{EmbedLiveSample("Logging user-defined names", "100%", "200px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("@font-feature-values")}}
