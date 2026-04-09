---
title: <xsl:number>
slug: Web/XML/XSLT/Reference/Element/number
page-type: xslt-element
sidebar: xmlsidebar
---

Phần tử `<xsl:number>` đánh số các mục theo thứ tự. Nó cũng có thể được dùng để định dạng nhanh một con số.

## Syntax

```xml
<xsl:number
  count=EXPRESSION
  level="single" | "multiple" | "any"
  from=EXPRESSION
  value=EXPRESSION
  format=FORMAT-STRING
  lang=XML:LANG-CODE
  letter-value="alphabetic" | "traditional"
  grouping-separator=CHARACTER
  grouping-size=NUMBER  />
```

### Required Attributes

Không có.

### Optional Attributes

- `count`
  - : Chỉ định những gì trong cây nguồn sẽ được đánh số tuần tự. Nó dùng một biểu thức XPath.
- `level`
  - : Xác định các cấp của cây nguồn sẽ được xem xét như thế nào khi tạo số thứ tự. Nó có ba giá trị hợp lệ: `single`, `multiple`, và `any`. Giá trị mặc định là `single`:
    - `single`
      - : Đánh số các nút anh em theo thứ tự, như các mục trong một danh sách. Bộ xử lý đi tới nút đầu tiên trên trục [`ancestor-or-self`](/en-US/docs/Web/XML/XPath/Reference/Axes#ancestor-or-self) khớp với thuộc tính `count`, rồi đếm nút đó cộng với tất cả các nút anh em đứng trước nó (dừng lại khi gặp một nút khớp với thuộc tính `from`, nếu có) mà cũng khớp với thuộc tính `count`. Nếu không tìm thấy kết quả khớp nào, chuỗi sẽ là một danh sách rỗng.
    - `multiple`
      - : Đánh số các nút như một chuỗi tổng hợp phản ánh vị trí phân cấp của nút, ví dụ 1.2.2.5. (Định dạng lồng nhau có thể được chỉ định bằng thuộc tính `format`, ví dụ A.1.1). Bộ xử lý xem xét tất cả các [`ancestors`](/en-US/docs/Web/XML/XPath/Reference/Axes#ancestor) của nút hiện tại và chính nút hiện tại, dừng lại khi gặp kết quả khớp cho thuộc tính `from`, nếu có. Với mỗi nút trong danh sách này khớp với thuộc tính `count`, bộ xử lý đếm có bao nhiêu nút anh em đứng trước nó cũng khớp, rồi cộng một cho chính nút đó. Nếu không tìm thấy kết quả khớp nào, chuỗi sẽ là một danh sách rỗng.
    - `any` (Hiện chưa được hỗ trợ.)
      - : Đánh số tất cả các nút khớp, bất kể cấp nào, theo thứ tự tuần tự. Các trục [`ancestor`](/en-US/docs/Web/XML/XPath/Reference/Axes#ancestor), [`self`](/en-US/docs/Web/XML/XPath/Reference/Axes#self), và [`preceding`](/en-US/docs/Web/XML/XPath/Reference/Axes#preceding) đều được xem xét. Bộ xử lý bắt đầu từ nút hiện tại và đi theo thứ tự tài liệu ngược, dừng lại nếu gặp một kết quả khớp với bất kỳ thuộc tính `from` nào. Nếu không tìm thấy nút nào khớp với thuộc tính `count`, chuỗi sẽ là một danh sách rỗng. Mức này hiện chưa được hỗ trợ.

- `from`
  - : Chỉ định nơi việc đánh số nên bắt đầu hoặc bắt đầu lại. Chuỗi bắt đầu với hậu duệ đầu tiên của nút khớp với thuộc tính `from`.
- `value`
  - : Áp dụng một định dạng cho số đã cho. Đây là một cách nhanh để định dạng một số do người dùng cung cấp (thay vì một số thứ tự của chuỗi nút) theo bất kỳ định dạng chuẩn nào của `<xsl:number>`.
- `format`
  - : Xác định định dạng của số được tạo:
    - `format="1"`
      - : `1 2 3 . . .` (Đây là định dạng duy nhất được hỗ trợ hiện tại)
    - `format="01"`
      - : `01 02 03 . . . 09 10 11 . . .`
    - `format="a"`
      - : `a b c . . .y z aa ab . . .`
    - `format="A"`
      - : `A B C . . . Y Z AA AB . . .`
    - `format="i"`
      - : `i ii iii iv v . . .`
    - `format="I"`
      - : `I II III IV V . . .`

- `lang` (Hiện chưa được hỗ trợ.)
  - : Chỉ định bảng chữ cái của ngôn ngữ nào sẽ được dùng cho các định dạng đánh số dựa trên chữ cái.
- `letter-value`
  - : Phân biệt giữa các chuỗi đánh số dùng chữ cái. Một số ngôn ngữ có hơn một hệ thống đánh số dùng chữ cái. Nếu cả hai hệ thống bắt đầu bằng cùng một token, sự mơ hồ có thể xảy ra. Thuộc tính này có thể nhận giá trị `alphabetic` hoặc `traditional`. Mặc định là `alphabetic`.
- `grouping-separator`
  - : Chỉ định ký tự nào sẽ được dùng làm dấu phân nhóm (ví dụ dấu phân tách hàng nghìn). Mặc định là dấu phẩy (`,`).
- `grouping-size`
  - : Cho biết số chữ số tạo thành một nhóm số. Giá trị mặc định là `3`.

### Type

Instruction, xuất hiện bên trong một template.

## Specifications

XSLT, section 7.7

## Gecko support

Hỗ trợ một phần. Xem phần ghi chú ở trên.
