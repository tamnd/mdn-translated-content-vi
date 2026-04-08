---
title: Intl.Collator() constructor
short-title: Intl.Collator()
slug: Web/JavaScript/Reference/Global_Objects/Intl/Collator/Collator
page-type: javascript-constructor
browser-compat: javascript.builtins.Intl.Collator.Collator
sidebar: jsref
---

Constructor **`Intl.Collator()`** tạo các đối tượng {{jsxref("Intl.Collator")}}.

{{InteractiveExample("JavaScript Demo: Intl.Collator() constructor")}}

```js interactive-example
console.log(["Z", "a", "z", "ä"].sort(new Intl.Collator("de").compare));
// Expected output: Array ["a", "ä", "z", "Z"]

console.log(["Z", "a", "z", "ä"].sort(new Intl.Collator("sv").compare));
// Expected output: Array ["a", "z", "Z", "ä"]

console.log(
  ["Z", "a", "z", "ä"].sort(
    new Intl.Collator("de", { caseFirst: "upper" }).compare,
  ),
);
// Expected output: Array ["a", "ä", "Z", "z"]
```

## Cú pháp

```js-nolint
new Intl.Collator()
new Intl.Collator(locales)
new Intl.Collator(locales, options)

Intl.Collator()
Intl.Collator(locales)
Intl.Collator(locales, options)
```

> [!NOTE]
> `Intl.Collator()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai đều tạo ra một instance `Intl.Collator` mới.

### Tham số

- `locales` {{optional_inline}}
  - : Một chuỗi với {{glossary("BCP 47 language tag")}} hoặc một instance {{jsxref("Intl.Locale")}}, hoặc một mảng các mã định danh ngôn ngữ như vậy. Ngôn ngữ mặc định của runtime được sử dụng khi `undefined` được truyền vào hoặc khi không có mã định danh ngôn ngữ nào được chỉ định được hỗ trợ. Để biết dạng chung và cách diễn giải đối số `locales`, xem [mô tả tham số trên trang chính `Intl`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locales_argument).

    Các khóa mở rộng Unicode sau được phép:
    - `co`
      - : Xem [`collation`](#collation).
    - `kn`
      - : Xem [`numeric`](#numeric).
    - `kf`
      - : Xem [`caseFirst`](#casefirst).

    Các khóa này cũng có thể được đặt với `options` (như liệt kê bên dưới). Khi cả hai được đặt, thuộc tính `options` sẽ được ưu tiên.

- `options` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau, theo thứ tự được lấy ra (tất cả đều tùy chọn):
    - `usage`
      - : Liệu phép so sánh là để sắp xếp danh sách chuỗi hay lọc mờ (đối với chữ viết Latin, không phân biệt dấu phụ và chữ hoa/thường) một danh sách chuỗi theo khóa. Các giá trị có thể là:
        - `"sort"` (mặc định)
          - : Để sắp xếp một danh sách chuỗi.
        - `"search"`
          - : Để lọc một danh sách chuỗi bằng cách kiểm tra từng phần tử trong danh sách xem có khớp hoàn toàn với khóa hay không. Với `"search"`, người gọi chỉ nên quan tâm đến việc `compare()` trả về 0 hay khác 0, và không nên phân biệt các giá trị khác 0 với nhau. Nghĩa là, không phù hợp khi dùng `"search"` cho mục đích sắp xếp/thứ tự.
    - `localeMatcher`
      - : Thuật toán khớp ngôn ngữ cần sử dụng. Các giá trị có thể là `"lookup"` và `"best fit"`; mặc định là `"best fit"`. Để biết thêm thông tin về tùy chọn này, xem [Xác định và thương lượng ngôn ngữ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl#locale_identification_and_negotiation).
    - `collation`
      - : Biến thể đối chiếu cho một số ngôn ngữ nhất định, chẳng hạn `"emoji"`, `"pinyin"`, `"stroke"`, v.v. Chỉ có hiệu lực khi `usage` là `"sort"` (vì `"search"` về bản chất là kiểu đối chiếu riêng của nó). Để biết danh sách các kiểu đối chiếu được hỗ trợ, xem [`Intl.supportedValuesOf()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/supportedValuesOf#supported_collation_types); mặc định là `"default"`. Tùy chọn này cũng có thể được đặt thông qua khóa mở rộng Unicode `co`; nếu cả hai được cung cấp, thuộc tính `options` này sẽ được ưu tiên.
    - `numeric`
      - : Liệu có sử dụng đối chiếu số, ví dụ "1" < "2" < "10". Các giá trị có thể là `true` và `false`; mặc định là `false`. Tùy chọn này cũng có thể được đặt thông qua khóa mở rộng Unicode `kn`; nếu cả hai được cung cấp, thuộc tính `options` này sẽ được ưu tiên.
    - `caseFirst`
      - : Liệu chữ hoa hay chữ thường nên sắp xếp trước. Các giá trị có thể là `"upper"`, `"lower"`, và `"false"` (sử dụng mặc định của ngôn ngữ); mặc định là `"false"`. Tùy chọn này cũng có thể được đặt thông qua khóa mở rộng Unicode `kf`; nếu cả hai được cung cấp, thuộc tính `options` này sẽ được ưu tiên.
    - `sensitivity`
      - : Các sự khác biệt nào trong chuỗi dẫn đến kết quả khác 0. Các giá trị có thể là:
        - `"base"`
          - : Chỉ những chuỗi khác nhau ở chữ cái cơ sở được so sánh là không bằng nhau. Ví dụ: a ≠ b, a = á, a = A. Trong thuật toán đối chiếu Unicode, điều này tương đương với mức độ chính.
        - `"accent"`
          - : Chỉ những chuỗi khác nhau ở chữ cái cơ sở hoặc dấu phụ và các ký hiệu dấu khác được so sánh là không bằng nhau. Ví dụ: a ≠ b, a ≠ á, a = A. Trong thuật toán đối chiếu Unicode, điều này tương đương với mức độ phụ.
        - `"case"`
          - : Chỉ những chuỗi khác nhau ở chữ cái cơ sở hoặc chữ hoa/thường được so sánh là không bằng nhau. Ví dụ: a ≠ b, a = á, a ≠ A. Trong thuật toán đối chiếu Unicode, điều này tương đương với mức độ chính với xử lý mức độ chữ hoa/thường.
        - `"variant"`
          - : Các chuỗi khác nhau ở chữ cái cơ sở, dấu phụ và các ký hiệu dấu khác, hoặc chữ hoa/thường được so sánh là không bằng nhau. Các sự khác biệt khác cũng có thể được xem xét. Ví dụ: a ≠ b, a ≠ á, a ≠ A. Trong thuật toán đối chiếu Unicode, điều này tương đương với mức độ ba.

        Mặc định là `"variant"` cho usage `"sort"`; phụ thuộc vào ngôn ngữ cho usage `"search"` theo đặc tả, nhưng thường cũng là `"variant"`. Vì chức năng cốt lõi của `"search"` là lọc không phân biệt dấu và chữ hoa/thường, việc đặt thành `"base"` là hợp lý nhất (và có thể cả `"case"`).

    - `ignorePunctuation`
      - : Liệu có bỏ qua dấu câu hay không. Các giá trị có thể là `true` và `false`. Mặc định là `true` cho tiếng Thái (`th`) và `false` cho tất cả ngôn ngữ khác.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `locales` hoặc `options` chứa các giá trị không hợp lệ.

## Ví dụ

### Sử dụng Collator

Ví dụ sau minh họa các kết quả khác nhau có thể xảy ra khi một chuỗi xuất hiện trước, sau, hoặc ở cùng cấp độ với một chuỗi khác:

```js
console.log(new Intl.Collator().compare("a", "c")); // -1, hoặc một giá trị âm khác
console.log(new Intl.Collator().compare("c", "a")); // 1, hoặc một giá trị dương khác
console.log(new Intl.Collator().compare("a", "a")); // 0
```

Lưu ý rằng các kết quả hiển thị trong đoạn mã trên có thể thay đổi tùy theo trình duyệt và phiên bản trình duyệt. Điều này là do các giá trị phụ thuộc vào triển khai cụ thể. Đặc tả chỉ yêu cầu rằng các giá trị trước và sau là âm và dương.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.Collator")}}
- {{jsxref("Intl")}}
