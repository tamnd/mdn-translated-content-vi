---
title: PI Parameters
slug: Web/XML/XSLT/Guides/PI_Parameters
page-type: guide
sidebar: xmlsidebar
---

XSLT hỗ trợ khái niệm truyền tham số cho một stylesheet khi thực thi nó. Điều này đã có thể làm được từ lâu khi dùng {{domxref("XSLTProcessor")}} trong JavaScript. Tuy nhiên khi dùng một processing instruction (PI) `<?xml-stylesheet?>` thì trước đây không có cách nào để cung cấp tham số.

Để giải quyết điều này, hai PI mới đã được triển khai trong [Firefox 2](/en-US/docs/Mozilla/Firefox/Releases/2) (xem [Supported versions](#supported_versions) bên dưới để biết chi tiết), `<?xslt-param?>` và `<?xslt-param-namespace?>`. Cả hai PI đều có thể chứa "pseudo attributes" giống như PI `xml-stylesheet`.

Tài liệu sau truyền hai tham số "color" và "size" tới stylesheet "style.xsl".

```xml
<?xslt-param name="color" value="blue"?>
<?xslt-param name="size" select="2"?>
<?xml-stylesheet type="text/xsl" href="style.xsl"?>
```

Lưu ý rằng các PI này không có tác dụng khi việc biến đổi được thực hiện bằng đối tượng `XSLTProcessor` trong JavaScript.

## Processing instructions

Các thuộc tính trong PI `xslt-param` và `xslt-param-namespace` được phân tích theo các quy tắc được định nghĩa trong [xml-stylesheet](https://www.w3.org/TR/xml-stylesheet/). Mọi thuộc tính không được nhận diện phải bị bỏ qua. Việc phân tích bất kỳ thuộc tính nào cũng không được thất bại chỉ vì sự hiện diện của một thuộc tính không được nhận diện, miễn là thuộc tính đó tuân theo cú pháp trong `xml-stylesheet`.

Cả PI `xslt-param` và `xslt-param-namespace` đều phải xuất hiện trong prolog của tài liệu, tức là trước thẻ phần tử đầu tiên. Tất cả PI trong prolog phải được tôn trọng, cả những PI xuất hiện trước và sau bất kỳ PI `xml-stylesheet` nào.

Nếu có nhiều PI `xml-stylesheet`, các tham số áp dụng cho tất cả stylesheet như một hệ quả của việc tất cả stylesheet được nhập vào một stylesheet duy nhất theo đặc tả XSLT. Lưu ý rằng nhiều PI `xml-stylesheet` XSLT hiện không được Firefox hỗ trợ.

### xslt-param

PI `xslt-param` hỗ trợ 4 thuộc tính:

- `name`
  - : Phần local-name của tên tham số. Không có kiểm tra cú pháp nào được thực hiện trên thuộc tính này, tuy nhiên nếu nó không phải là một [NCName](https://www.w3.org/TR/xml-names/#NT-NCName) hợp lệ thì nó sẽ không bao giờ khớp với bất kỳ tham số nào trong stylesheet.
- `namespace`
  - : Namespace của tên tham số. Không có kiểm tra cú pháp nào được thực hiện trên thuộc tính này.
- `value`
  - : Chứa giá trị chuỗi cho tham số. Giá trị của thuộc tính được dùng làm giá trị của tham số. Kiểu dữ liệu sẽ luôn là _string_.
- `select`
  - : Một biểu thức [XPath](/en-US/docs/Web/XML/XPath) cho tham số. Giá trị của thuộc tính được phân tích như một biểu thức XPath. Kết quả của việc đánh giá biểu thức được dùng làm giá trị của tham số.

Nếu thuộc tính `name` bị thiếu hoặc rỗng, PI sẽ bị bỏ qua.

Nếu thuộc tính `namespace` bị thiếu hoặc rỗng, namespace rỗng được dùng.

Không phải là lỗi nếu bạn chỉ định một tên tham số không tồn tại trong stylesheet (hoặc là một biến trong stylesheet). PI sẽ bị bỏ qua.

Nếu cả `value` và `select` đều có mặt hoặc nếu không có cả `value` lẫn `select`, PI sẽ bị bỏ qua.

Lưu ý rằng `value="..."` không hoàn toàn tương đương với `select="'...'"` vì giá trị có thể chứa cả dấu nháy đơn lẫn dấu ngoặc kép.

#### Ví dụ

Đặt tham số 'color' thành chuỗi 'red':

```xml
<?xslt-param name="color" value="red"?>
```

Đặt tham số 'columns' thành số 2:

```xml
<?xslt-param name="columns" select="2"?>
```

Đặt tham số 'books' thành một node set chứa tất cả phần tử `<book>` trong namespace rỗng:

```xml
<?xslt-param name="books" select="//book"?>
```

Đặt tham số 'show-toc' thành boolean `true`:

```xml
<?xslt-param name="show-toc" select="true()"?>
```

#### Ngữ cảnh của thuộc tính select

Ngữ cảnh sau được dùng để phân tích và đánh giá biểu thức trong thuộc tính **select**.

- Node ngữ cảnh là node được dùng làm node hiện tại ban đầu khi thực thi stylesheet.
- Vị trí ngữ cảnh là vị trí của node ngữ cảnh trong danh sách node hiện tại ban đầu được dùng khi thực thi stylesheet.
- Kích thước ngữ cảnh là kích thước của danh sách node hiện tại ban đầu được dùng khi thực thi stylesheet.
- Không có biến nào sẵn dùng.
- Thư viện hàm là thư viện hàm XPath tiêu chuẩn.
- Các khai báo namespace được xác định bởi các PI `xslt-param-namespace`, xem bên dưới.

Nếu thuộc tính **select** không thể phân tích hoặc thực thi, PI sẽ bị bỏ qua (đặc biệt là nó không rơi lại sang thuộc tính **value**).

### xslt-param-namespace

PI `xslt-param-namespace` dùng hai thuộc tính:

- prefix
  - : Prefix được ánh xạ.
- namespace
  - : Namespace mà prefix ánh xạ tới.

PI `xslt-param-namespace` ảnh hưởng đến biểu thức trong thuộc tính **select** cho tất cả `xslt-param` đứng sau PI đó. Điều này áp dụng ngay cả khi có các node khác như comment hoặc PI khác nằm giữa `xslt-param-namespace` và `xslt-param`.

Việc nhiều PI dùng cùng một prefix không phải là lỗi, mỗi PI mới chỉ thay đổi prefix đó ánh xạ tới namespace nào.

Nếu **prefix** bị thiếu, rỗng, hoặc bằng một NCName không hợp lệ, PI sẽ bị bỏ qua.

Nếu **namespace** bị thiếu, PI sẽ bị bỏ qua. Nếu **namespace** rỗng, ánh xạ prefix sẽ bị xóa.

#### Ví dụ

Đặt tham số 'books' thành một node set chứa tất cả phần tử `<book>` trong namespace `http://www.example.org/myNamespace`:

```xml
<?xslt-param-namespace prefix="my" namespace="http://www.example.org/myNamespace"?>
<?xslt-param name="books" select="//my:book"?>
```

## Các phiên bản được hỗ trợ

Được hỗ trợ từ Firefox 2.0.0.1. Thuộc tính **value** được hỗ trợ trong Firefox 2, nhưng thuộc tính **select** bị crash với một số biểu thức trong bản phát hành 2.0.

## Các phát triển có thể có trong tương lai

Chúng ta có nên cho phép bất kỳ hàm XSLT nào trong biểu thức không? `document()` có vẻ hữu ích, nhưng có vẻ khó để duy trì bất biến rằng `generate-id()` nên tạo ra cùng một chuỗi cho cùng một tài liệu.

Còn việc truy vấn các tham số URL trong stylesheet XSLT thì sao? Ví dụ: truyền chúng vào các `<xsl:param>` được chỉ định.
