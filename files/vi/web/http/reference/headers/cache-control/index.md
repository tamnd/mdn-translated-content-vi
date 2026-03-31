---
title: Cache-Control header
short-title: Cache-Control
slug: Web/HTTP/Reference/Headers/Cache-Control
page-type: http-header
browser-compat: http.headers.Cache-Control
sidebar: http
---

Tiêu đề HTTP **`Cache-Control`** chứa _các chỉ thị_ (hướng dẫn) trong cả yêu cầu và phản hồi để kiểm soát [bộ nhớ đệm](/en-US/docs/Web/HTTP/Guides/Caching) trong trình duyệt và các bộ nhớ đệm dùng chung (ví dụ: Proxy, CDN).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header", "Tiêu đề yêu cầu")}},
        {{Glossary("Response header", "Tiêu đề phản hồi")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Cache-Control: <directive>, <directive>, ...
```

Các chỉ thị bộ nhớ đệm tuân theo các quy tắc sau:

- Các chỉ thị bộ nhớ đệm không phân biệt chữ hoa/thường. Tuy nhiên, chữ thường được khuyến nghị vì một số triển khai không nhận ra chỉ thị chữ hoa.
- Nhiều chỉ thị được phép và phải được phân tách bằng dấu phẩy (ví dụ: `Cache-control: max-age=180, public`).
- Một số chỉ thị có đối số tùy chọn. Khi đối số được cung cấp, nó được phân tách khỏi tên chỉ thị bằng ký hiệu bằng (`=`). Thông thường, các đối số cho chỉ thị là số nguyên và do đó không được đặt trong dấu nháy (ví dụ: `Cache-control: max-age=12`).

### Các chỉ thị bộ nhớ đệm

Bảng sau liệt kê các chỉ thị `Cache-Control` tiêu chuẩn:

| Yêu cầu          | Phản hồi                 |
| ---------------- | ------------------------ |
| `max-age`        | `max-age`                |
| `max-stale`      | -                        |
| `min-fresh`      | -                        |
| -                | `s-maxage`               |
| `no-cache`       | `no-cache`               |
| `no-store`       | `no-store`               |
| `no-transform`   | `no-transform`           |
| `only-if-cached` | -                        |
| -                | `must-revalidate`        |
| -                | `proxy-revalidate`       |
| -                | `must-understand`        |
| -                | `private`                |
| -                | `public`                 |
| -                | `immutable`              |
| -                | `stale-while-revalidate` |
| `stale-if-error` | `stale-if-error`         |

Lưu ý: Kiểm tra [bảng tương thích](#browser_compatibility) để biết hỗ trợ của chúng; các tác nhân người dùng không nhận ra chúng nên bỏ qua chúng.

## Từ vựng

Phần này định nghĩa các thuật ngữ được sử dụng trong tài liệu này, một số trong đó xuất phát từ thông số kỹ thuật.

- Bộ nhớ đệm (HTTP)
  - : Triển khai giữ các yêu cầu và phản hồi để tái sử dụng trong các yêu cầu tiếp theo. Nó có thể là bộ nhớ đệm dùng chung hoặc riêng tư.
- Bộ nhớ đệm dùng chung
  - : Bộ nhớ đệm tồn tại giữa máy chủ gốc và máy khách (ví dụ: Proxy, CDN). Nó lưu trữ một phản hồi duy nhất và tái sử dụng với nhiều người dùng — vì vậy các nhà phát triển nên tránh lưu trữ nội dung cá nhân hóa trong bộ nhớ đệm dùng chung.
- Bộ nhớ đệm riêng tư
  - : Bộ nhớ đệm tồn tại trong máy khách. Còn được gọi là _bộ nhớ đệm cục bộ_ hoặc _bộ nhớ đệm trình duyệt_. Nó có thể lưu trữ và tái sử dụng nội dung cá nhân hóa cho một người dùng duy nhất.
- Lưu trữ phản hồi
  - : Lưu trữ phản hồi trong bộ nhớ đệm khi phản hồi có thể được lưu vào bộ nhớ đệm. Tuy nhiên, phản hồi được lưu vào bộ nhớ đệm không phải lúc nào cũng được tái sử dụng nguyên trạng. (Thông thường, "cache" có nghĩa là lưu trữ phản hồi.)
- Tái sử dụng phản hồi
  - : Tái sử dụng các phản hồi được lưu vào bộ nhớ đệm cho các yêu cầu tiếp theo.
- Xác thực lại phản hồi
  - : Hỏi máy chủ gốc liệu phản hồi được lưu trữ có còn [mới (fresh)](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) hay không. Thông thường, việc xác thực lại được thực hiện thông qua một yêu cầu có điều kiện.
- Phản hồi mới (Fresh)
  - : Chỉ ra rằng phản hồi là [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age). Điều này thường có nghĩa là phản hồi có thể được tái sử dụng cho các yêu cầu tiếp theo, tùy thuộc vào các chỉ thị yêu cầu.
- Phản hồi cũ (Stale)
  - : Chỉ ra rằng phản hồi là [phản hồi cũ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age). Điều này thường có nghĩa là phản hồi không thể được tái sử dụng nguyên trạng. Bộ lưu trữ bộ nhớ đệm không bắt buộc phải xóa các phản hồi cũ ngay lập tức vì việc xác thực lại có thể thay đổi phản hồi từ cũ sang mới trở lại.
- Tuổi
  - : Thời gian kể từ khi phản hồi được tạo ra. Đây là tiêu chí để xác định liệu phản hồi là [mới hay cũ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age).

## Chỉ thị

Phần này liệt kê các chỉ thị ảnh hưởng đến bộ nhớ đệm — cả chỉ thị phản hồi và chỉ thị yêu cầu.

### Chỉ thị phản hồi

#### `max-age`

Chỉ thị phản hồi `max-age=N` chỉ ra rằng phản hồi vẫn [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) cho đến _N_ giây sau khi phản hồi được tạo ra.

```http
Cache-Control: max-age=604800
```

Chỉ ra rằng các bộ nhớ đệm có thể lưu trữ phản hồi này và tái sử dụng nó cho các yêu cầu tiếp theo trong khi nó còn [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age).

Lưu ý rằng `max-age` không phải là thời gian trôi qua kể từ khi phản hồi được nhận; đó là thời gian trôi qua kể từ khi phản hồi được tạo ra trên máy chủ gốc.
Vì vậy nếu (các) bộ nhớ đệm khác — trên tuyến đường mạng mà phản hồi đi qua — lưu trữ phản hồi trong 100 giây (được chỉ ra bằng cách sử dụng trường tiêu đề phản hồi `Age`), bộ nhớ đệm trình duyệt sẽ trừ 100 giây từ [thời gian tươi (freshness lifetime)](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) của nó.

Nếu giá trị `max-age` là âm (ví dụ: `-1`) hoặc không phải là số nguyên (ví dụ: `3599.99`), thì hành vi bộ nhớ đệm không được xác định. Các bộ nhớ đệm được khuyến khích xử lý giá trị như thể nó là `0`.

```http
Cache-Control: max-age=604800
Age: 100
```

#### `s-maxage`

Chỉ thị phản hồi `s-maxage` chỉ ra thời gian phản hồi vẫn [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) trong bộ nhớ đệm dùng chung.
Chỉ thị `s-maxage` bị bỏ qua bởi các bộ nhớ đệm riêng tư, và ghi đè giá trị được chỉ định bởi chỉ thị `max-age` hoặc tiêu đề `Expires` cho các bộ nhớ đệm dùng chung, nếu chúng có mặt.

```http
Cache-Control: s-maxage=604800
```

#### `no-cache`

Chỉ thị phản hồi `no-cache` chỉ ra rằng phản hồi có thể được lưu trữ trong bộ nhớ đệm, nhưng phản hồi phải được xác thực với máy chủ gốc trước mỗi lần tái sử dụng, ngay cả khi bộ nhớ đệm bị ngắt kết nối khỏi máy chủ gốc.

```http
Cache-Control: no-cache
```

Nếu bạn muốn các bộ nhớ đệm luôn kiểm tra các cập nhật nội dung trong khi tái sử dụng nội dung được lưu trữ, `no-cache` là chỉ thị cần sử dụng. Nó thực hiện điều này bằng cách yêu cầu các bộ nhớ đệm xác thực lại mỗi yêu cầu với máy chủ gốc.

Lưu ý rằng `no-cache` không có nghĩa là "đừng lưu vào bộ nhớ đệm". `no-cache` cho phép các bộ nhớ đệm lưu trữ phản hồi nhưng yêu cầu chúng xác thực lại trước khi tái sử dụng. Nếu ý nghĩa "đừng lưu vào bộ nhớ đệm" mà bạn muốn là thực sự "đừng lưu trữ", thì `no-store` là chỉ thị cần sử dụng.

#### `must-revalidate`

Chỉ thị phản hồi `must-revalidate` chỉ ra rằng phản hồi có thể được lưu trữ trong bộ nhớ đệm và có thể được tái sử dụng trong khi còn [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age). Nếu phản hồi trở nên [cũ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age), nó phải được xác thực với máy chủ gốc trước khi tái sử dụng.

Thông thường, `must-revalidate` được sử dụng với `max-age`.

```http
Cache-Control: max-age=604800, must-revalidate
```

HTTP cho phép các bộ nhớ đệm tái sử dụng [các phản hồi cũ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) khi chúng bị ngắt kết nối khỏi máy chủ gốc. `must-revalidate` là cách ngăn điều này xảy ra - hoặc phản hồi được lưu trữ được xác thực lại với máy chủ gốc hoặc phản hồi 504 (Gateway Timeout) được tạo ra.

#### `proxy-revalidate`

Chỉ thị phản hồi `proxy-revalidate` tương đương với `must-revalidate`, nhưng đặc biệt chỉ dành cho các bộ nhớ đệm dùng chung.

#### `no-store`

Chỉ thị phản hồi `no-store` chỉ ra rằng bất kỳ bộ nhớ đệm nào (riêng tư hoặc dùng chung) không nên lưu trữ phản hồi này.

```http
Cache-Control: no-store
```

#### `private`

Chỉ thị phản hồi `private` chỉ ra rằng phản hồi chỉ có thể được lưu trữ trong bộ nhớ đệm riêng tư (ví dụ: bộ nhớ đệm cục bộ trong trình duyệt).

```http
Cache-Control: private
```

Bạn nên thêm chỉ thị `private` cho nội dung được cá nhân hóa cho người dùng, đặc biệt là cho các phản hồi nhận được sau khi đăng nhập và cho các phiên được quản lý qua cookie.

Nếu bạn quên thêm `private` vào phản hồi có nội dung cá nhân hóa, thì phản hồi đó có thể được lưu trữ trong bộ nhớ đệm dùng chung và cuối cùng được tái sử dụng cho nhiều người dùng, điều này có thể gây rò rỉ thông tin cá nhân.

#### `public`

Chỉ thị phản hồi `public` chỉ ra rằng phản hồi có thể được lưu trữ trong bộ nhớ đệm dùng chung. Các phản hồi cho các yêu cầu có trường tiêu đề `Authorization` không được lưu trữ trong bộ nhớ đệm dùng chung; tuy nhiên, chỉ thị `public` sẽ làm cho các phản hồi đó được lưu trữ trong bộ nhớ đệm dùng chung.

```http
Cache-Control: public
```

Nói chung, khi các trang nằm dưới Basic Auth hoặc Digest Auth, trình duyệt gửi các yêu cầu với tiêu đề `Authorization`. Điều này có nghĩa là phản hồi được kiểm soát truy cập cho người dùng bị hạn chế (có tài khoản), và về cơ bản không thể chia sẻ vào bộ nhớ đệm, ngay cả khi nó có `max-age`.

Bạn có thể sử dụng chỉ thị `public` để bỏ khóa hạn chế đó.

```http
Cache-Control: public, max-age=604800
```

Lưu ý rằng `s-maxage` hoặc `must-revalidate` cũng bỏ khóa hạn chế đó.

#### `must-understand`

Chỉ thị phản hồi `must-understand` chỉ ra rằng bộ nhớ đệm nên lưu trữ phản hồi chỉ khi nó hiểu các yêu cầu để lưu vào bộ nhớ đệm dựa trên mã trạng thái.

`must-understand` nên được kết hợp với `no-store` để có hành vi dự phòng.

```http
Cache-Control: must-understand, no-store
```

Nếu bộ nhớ đệm không hỗ trợ `must-understand`, nó sẽ bị bỏ qua. Nếu `no-store` cũng có mặt, phản hồi không được lưu trữ.

Nếu bộ nhớ đệm hỗ trợ `must-understand`, nó lưu trữ phản hồi với sự hiểu biết về các yêu cầu bộ nhớ đệm dựa trên mã trạng thái.

#### `no-transform`

Một số trung gian chuyển đổi nội dung vì nhiều lý do khác nhau. Ví dụ, một số chuyển đổi hình ảnh để giảm kích thước truyền. Trong một số trường hợp, điều này không mong muốn đối với nhà cung cấp nội dung.

`no-transform` chỉ ra rằng bất kỳ trung gian nào (bất kể có triển khai bộ nhớ đệm hay không) không nên chuyển đổi nội dung phản hồi.

#### `immutable`

Chỉ thị phản hồi `immutable` chỉ ra rằng phản hồi sẽ không được cập nhật trong khi còn [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age).

```http
Cache-Control: public, max-age=604800, immutable
```

Thực hành hiện đại tốt nhất cho các tài nguyên tĩnh là bao gồm phiên bản/hash trong URL của chúng, trong khi không bao giờ sửa đổi các tài nguyên — nhưng thay vào đó, khi cần thiết, _cập nhật_ các tài nguyên với các phiên bản mới hơn có số phiên bản/hash mới, để URL của chúng khác nhau. Điều đó được gọi là mẫu **cache-busting**.

```html
<script src="https://example.com/react.0.0.0.js"></script>
```

Khi người dùng tải lại trình duyệt, trình duyệt sẽ gửi các yêu cầu có điều kiện để xác thực với máy chủ gốc. Nhưng không cần thiết phải xác thực lại những loại tài nguyên tĩnh như vậy ngay cả khi người dùng tải lại trình duyệt, vì chúng không bao giờ được sửa đổi.
`immutable` cho bộ nhớ đệm biết rằng phản hồi là bất biến trong khi còn [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) và tránh những loại yêu cầu có điều kiện không cần thiết đến máy chủ.

#### `stale-while-revalidate`

Chỉ thị phản hồi `stale-while-revalidate` chỉ ra rằng bộ nhớ đệm có thể tái sử dụng phản hồi cũ trong khi xác thực lại nó với bộ nhớ đệm.

```http
Cache-Control: max-age=604800, stale-while-revalidate=86400
```

Trong ví dụ trên, phản hồi còn [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) trong 7 ngày (604800s).
Sau 7 ngày nó trở nên [cũ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age), nhưng bộ nhớ đệm được phép tái sử dụng nó cho bất kỳ yêu cầu nào được thực hiện trong ngày tiếp theo (86400s), với điều kiện chúng xác thực lại phản hồi trong nền.

#### `stale-if-error`

Chỉ thị phản hồi `stale-if-error` chỉ ra rằng bộ nhớ đệm có thể tái sử dụng [phản hồi cũ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) khi máy chủ upstream tạo ra lỗi, hoặc khi lỗi được tạo ra cục bộ. Ở đây, lỗi được coi là bất kỳ phản hồi nào có mã trạng thái 500, 502, 503, hoặc 504.

```http
Cache-Control: max-age=604800, stale-if-error=86400
```

### Chỉ thị yêu cầu

#### `no-cache`

Chỉ thị yêu cầu `no-cache` yêu cầu các bộ nhớ đệm xác thực phản hồi với máy chủ gốc trước khi tái sử dụng.

```http
Cache-Control: no-cache
```

#### `no-store`

Chỉ thị yêu cầu `no-store` cho phép máy khách yêu cầu các bộ nhớ đệm không lưu trữ yêu cầu và phản hồi tương ứng — ngay cả khi phản hồi của máy chủ gốc có thể được lưu trữ.

```http
Cache-Control: no-store
```

#### `max-age`

Chỉ thị yêu cầu `max-age=N` chỉ ra rằng máy khách cho phép phản hồi được lưu trữ được tạo ra trên máy chủ gốc trong _N_ giây — trong đó _N_ có thể là bất kỳ số nguyên không âm nào (bao gồm `0`).

```http
Cache-Control: max-age=10800
```

#### `max-stale`

Chỉ thị yêu cầu `max-stale=N` chỉ ra rằng máy khách cho phép phản hồi được lưu trữ đã [cũ](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) trong _N_ giây. Nếu không có giá trị _N_ nào được chỉ định, máy khách sẽ chấp nhận phản hồi cũ ở bất kỳ tuổi nào.

```http
Cache-Control: max-stale=3600
```

#### `min-fresh`

Chỉ thị yêu cầu `min-fresh=N` chỉ ra rằng máy khách cho phép phản hồi được lưu trữ đang [mới](/en-US/docs/Web/HTTP/Guides/Caching#fresh_and_stale_based_on_age) trong ít nhất _N_ giây.

```http
Cache-Control: min-fresh=600
```

#### `only-if-cached`

Máy khách chỉ ra rằng phản hồi đã được lưu vào bộ nhớ đệm nên được trả về. Nếu bộ nhớ đệm có phản hồi được lưu trữ, ngay cả phản hồi cũ, nó sẽ được trả về. Nếu không có phản hồi được lưu vào bộ nhớ đệm nào có sẵn, phản hồi [504 Gateway Timeout](/en-US/docs/Web/HTTP/Reference/Status/504) sẽ được trả về.

## Trường hợp sử dụng

### Ngăn lưu trữ

Nếu bạn không muốn phản hồi được lưu trữ trong bộ nhớ đệm, hãy sử dụng chỉ thị `no-store`.

```http
Cache-Control: no-store
```

### Bộ nhớ đệm tài nguyên tĩnh với "cache busting"

Khi bạn xây dựng tài nguyên tĩnh với các cơ chế phiên bản/hash, việc thêm phiên bản/hash vào tên tệp hoặc chuỗi truy vấn là cách tốt để quản lý bộ nhớ đệm.

```html
<!-- index.html -->
<script src="/assets/react.min.js"></script>
<img src="/assets/hero.png" width="900" height="400" />
```

Bạn có thể thêm giá trị `max-age` dài và `immutable` vì nội dung sẽ không bao giờ thay đổi.

```http
# /assets/*
Cache-Control: max-age=31536000, immutable
```

### Nội dung luôn cập nhật

Đối với nội dung được tạo động, hoặc nội dung tĩnh nhưng được cập nhật thường xuyên, bạn muốn người dùng luôn nhận được phiên bản mới nhất.

```http
Cache-Control: no-cache
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
