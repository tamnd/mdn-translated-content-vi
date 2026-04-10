---
title: CSSCounterStyleRule
slug: Web/API/CSSCounterStyleRule
page-type: web-api-interface
browser-compat: api.CSSCounterStyleRule
---

{{APIRef("CSSOM")}}

Giao diện **`CSSCounterStyleRule`** biểu diễn một [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) {{CSSxRef("@counter-style")}}.

{{InheritanceDiagram}}

## Thuộc tính instance

_Giao diện này cũng kế thừa các thuộc tính từ {{DOMxRef("CSSRule")}} của nó._

- {{DOMxRef("CSSCounterStyleRule.name")}}
  - : Một chuỗi chứa phần tuần tự hóa của {{CSSxRef("&lt;custom-ident&gt;")}} được định nghĩa là `name` cho quy tắc tương ứng.
- {{DOMxRef("CSSCounterStyleRule.system")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/system", "system")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.symbols")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/symbols", "symbols")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.additiveSymbols")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/additive-symbols", "additive-symbols")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.negative")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/negative", "negative")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.prefix")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/prefix", "prefix")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.suffix")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/suffix", "suffix")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.range")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/range", "range")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.pad")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/pad", "pad")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.speakAs")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/speak-as", "speak-as")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.
- {{DOMxRef("CSSCounterStyleRule.fallback")}}
  - : Một chuỗi chứa phần tuần tự hóa của bộ mô tả {{CSSxRef("@counter-style/fallback", "fallback")}} được định nghĩa cho quy tắc tương ứng. Nếu bộ mô tả không được chỉ định trong quy tắc tương ứng, thuộc tính sẽ trả về một chuỗi rỗng.

## Phương thức instance

_Giao diện này không triển khai bất kỳ phương thức cụ thể nào nhưng kế thừa các phương thức từ {{DOMxRef("CSSRule")}} của nó._

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("@counter-style")}}
- Mô-đun [Các kiểu bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Hướng dẫn [Sử dụng bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters)
