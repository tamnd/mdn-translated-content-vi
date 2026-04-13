---
title: CSS Typed Object Model API
slug: Web/API/CSS_Typed_OM_API
page-type: web-api-overview
browser-compat:
  - api.CSSStyleValue
  - api.StylePropertyMap
  - api.CSSUnparsedValue
  - api.CSSKeywordValue
---

{{DefaultAPISidebar("CSS Typed Object Model API")}}

CSS Typed Object Model API đơn giản hóa thao tác thuộc tính CSS bằng cách biểu thị các giá trị CSS dưới dạng các đối tượng JavaScript có kiểu thay vì chuỗi. Điều này không chỉ đơn giản hóa thao tác CSS mà còn giảm thiểu tác động tiêu cực đến hiệu suất so với {{domxref('HTMLElement.style')}}.

Nói chung, các giá trị CSS có thể được đọc và ghi trong JavaScript dưới dạng chuỗi, điều này có thể chậm và cồng kềnh. CSS Typed Object Model API cung cấp các giao diện để tương tác với các giá trị cơ bản, bằng cách biểu diễn chúng với các đối tượng JS chuyên biệt có thể được thao tác và hiểu dễ dàng và đáng tin cậy hơn so với phân tích và nối chuỗi. Điều này dễ dàng hơn cho tác giả (ví dụ: các giá trị số được phản ánh với các số JS thực tế và có các phép toán toán học nhận thức đơn vị được định nghĩa cho chúng). Nó cũng thường nhanh hơn, vì các giá trị có thể được thao tác trực tiếp và sau đó được dịch lại thành các giá trị cơ bản mà không cần xây dựng và phân tích chuỗi CSS.

CSS Typed OM cho phép thao tác hiệu quả các giá trị được gán cho các thuộc tính CSS trong khi cho phép mã bảo trì được dễ hiểu và dễ viết hơn.

## Giao diện

### `CSSStyleValue`

Giao diện {{domxref('CSSStyleValue')}} của CSS Typed Object Model API là lớp cơ sở của tất cả các giá trị CSS có thể truy cập thông qua Typed OM API. Một phiên bản của lớp này có thể được sử dụng ở bất kỳ đâu một chuỗi được mong đợi.

- {{domxref('CSSStyleValue/parse_static', 'CSSStyleValue.parse()')}}
  - : Phương thức cho phép `CSSNumericValue` được xây dựng từ một chuỗi CSS. Nó đặt một thuộc tính CSS cụ thể thành các giá trị được chỉ định và trả về giá trị đầu tiên dưới dạng đối tượng `CSSStyleValue`.
- {{domxref('CSSStyleValue.parseAll_static', 'CSSStyleValue.parseAll()')}}
  - : Phương thức đặt tất cả các lần xuất hiện của một thuộc tính CSS cụ thể thành giá trị được chỉ định và trả về một mảng các đối tượng `CSSStyleValue`, mỗi đối tượng chứa một trong các giá trị được cung cấp.

### `StylePropertyMap`

Giao diện {{domxref('StylePropertyMap')}} của CSS Typed Object Model API cung cấp biểu diễn của một khối khai báo CSS là một giải pháp thay thế cho `CSSStyleDeclaration`.

- {{domxref('StylePropertyMap.set()')}}
  - : Phương thức thay đổi khai báo CSS với thuộc tính đã cho thành giá trị đã cho.
- {{domxref('StylePropertyMap.append()')}}
  - : Phương thức thêm một khai báo CSS mới vào `StylePropertyMap` với thuộc tính và giá trị đã cho.
- {{domxref('StylePropertyMap.delete()')}}
  - : Phương thức xóa khai báo CSS với thuộc tính đã cho khỏi `StylePropertyMap`.
- {{domxref('StylePropertyMap.clear()')}}
  - : Phương thức xóa tất cả các khai báo trong `StylePropertyMap`.

### `CSSUnparsedValue`

Giao diện {{domxref('CSSUnparsedValue')}} của CSS Typed Object Model API đại diện cho các giá trị thuộc tính tham chiếu đến các thuộc tính tùy chỉnh. Nó bao gồm một danh sách các đoạn chuỗi và các tham chiếu biến.

- Hàm khởi tạo {{domxref("CSSUnparsedValue.CSSUnparsedValue", "CSSUnparsedValue()")}}
  - : Tạo một đối tượng `CSSUnparsedValue` mới đại diện cho các giá trị thuộc tính tham chiếu đến các thuộc tính tùy chỉnh.
- {{domxref('CSSUnparsedValue.entries()')}}
  - : Phương thức trả về một mảng các cặp thuộc tính `[key, value]` của đối tượng theo cùng thứ tự như trong vòng lặp `for...in`.
- {{domxref('CSSUnparsedValue.forEach()')}}
  - : Phương thức thực thi một hàm được cung cấp một lần cho mỗi phần tử của `CSSUnparsedValue`.
- {{domxref('CSSUnparsedValue.keys()')}}
  - : Phương thức trả về một đối tượng _array iterator_ mới chứa các khóa cho mỗi chỉ mục trong mảng.

### Tuần tự hóa `CSSKeywordValue`

Giao diện {{domxref('CSSKeywordValue')}} của CSS Typed Object Model API tạo ra một đối tượng để biểu diễn các từ khóa CSS và các định danh khác.

- Hàm khởi tạo {{domxref("CSSKeywordValue.CSSKeywordValue", "CSSKeywordValue()")}}
  - : Hàm khởi tạo tạo một đối tượng {{domxref("CSSKeywordValue.CSSKeywordValue", "CSSKeywordValue()")}} mới biểu diễn các từ khóa CSS và các định danh khác.
- {{domxref('CSSKeywordValue.value()')}}
  - : Thuộc tính của giao diện `CSSKeywordValue` trả về hoặc đặt giá trị của `CSSKeywordValue`.

## Giao diện CSSStyleValue

{{domxref('CSSStyleValue')}} là lớp cơ sở thông qua đó tất cả các giá trị CSS được biểu diễn. Các lớp con bao gồm:

- {{domxref('CSSImageValue')}}
  - : Giao diện biểu diễn các giá trị cho các thuộc tính nhận hình ảnh, ví dụ {{cssxref("background-image")}}, {{cssxref("list-style-image")}} hoặc {{cssxref("border-image-source")}}.
- {{domxref('CSSKeywordValue')}}
  - : Giao diện tạo ra một đối tượng biểu diễn các từ khóa CSS và các định danh khác. Khi được sử dụng ở nơi một chuỗi được mong đợi, nó sẽ trả về giá trị của `CSSKeyword.value`.
- {{domxref('CSSMathValue')}}
  - : Một cây con lớp biểu diễn các giá trị số phức tạp hơn một giá trị và đơn vị duy nhất, bao gồm:
    - {{domxref('CSSMathMax')}} - biểu diễn hàm CSS {{cssxref("max","max()")}}.
    - {{domxref('CSSMathMin')}} - biểu diễn hàm CSS {{cssxref("min","min()")}}.
    - {{domxref('CSSMathNegate')}} - phủ định giá trị được truyền vào.
    - {{domxref('CSSMathInvert')}} - biểu diễn giá trị CSS {{cssxref("calc","calc()")}} được sử dụng như `calc(1 / <value>)`.
    - {{domxref('CSSMathProduct')}} - biểu diễn kết quả thu được bằng cách gọi {{domxref('CSSNumericValue.mul','mul()')}} hoặc {{domxref('CSSNumericValue.div','div()')}} trên {{domxref('CSSNumericValue')}}.
    - {{domxref('CSSMathSum')}} - biểu diễn kết quả thu được bằng cách gọi {{domxref('CSSNumericValue.add','add()')}}, {{domxref('CSSNumericValue.sub','sub()')}} hoặc {{domxref('CSSNumericValue.toSum','toSum()')}} trên {{domxref('CSSNumericValue')}}.

- {{domxref('CSSNumericValue')}}
  - : Giao diện biểu diễn các phép toán mà tất cả các giá trị số có thể thực hiện, bao gồm:
    - {{domxref('CSSNumericValue.add')}} - Cộng các số được cung cấp vào `CSSNumericValue`.
    - {{domxref('CSSNumericValue.sub')}} - Trừ các số được cung cấp khỏi `CSSNumericValue`.
    - {{domxref('CSSNumericValue.mul')}} - Nhân các số được cung cấp với `CSSNumericValue`.
    - {{domxref('CSSNumericValue.div')}} - Chia `CSSNumericValue` cho giá trị được cung cấp, báo lỗi nếu là `0`.
    - {{domxref('CSSNumericValue.min')}} - Trả về giá trị nhỏ nhất được truyền vào.
    - {{domxref('CSSNumericValue.max')}} - Trả về giá trị lớn nhất được truyền vào.
    - {{domxref('CSSNumericValue.equals')}} - Trả về true nếu tất cả các giá trị có cùng loại và giá trị, theo cùng thứ tự. Ngược lại, false.
    - {{domxref('CSSNumericValue.to')}} - Chuyển đổi `value` sang giá trị khác với _đơn vị_ được chỉ định.
    - {{domxref('CSSNumericValue.toSum')}}
    - {{domxref('CSSNumericValue.type')}}
    - {{domxref('CSSNumericValue/parse_static', 'CSSNumericValue.parse')}} - Trả về một số được phân tích từ chuỗi CSS.

- {{domxref('CSSPositionValue')}}
  - : Biểu diễn các giá trị cho các thuộc tính nhận một vị trí, ví dụ object-position.
- {{domxref('CSSTransformValue')}}
  - : Giao diện biểu diễn một danh sách các giá trị {{cssxref("transform")}}. Chúng "chứa" một hoặc nhiều {{domxref('CSSTransformComponent')}}, biểu diễn các giá trị hàm `transform` riêng lẻ.
- {{domxref('CSSUnitValue')}}
  - : Giao diện biểu diễn các giá trị số có thể được biểu diễn dưới dạng một đơn vị duy nhất hoặc một số được đặt tên và phần trăm.
- {{domxref('CSSUnparsedValue')}}
  - : Biểu diễn các giá trị thuộc tính tham chiếu [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Reference/Properties/--*). Nó bao gồm một danh sách các đoạn chuỗi và các tham chiếu biến.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [Sử dụng CSS Typed Object Model](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)
- [CSS Houdini](/en-US/docs/Web/API/Houdini_APIs)
