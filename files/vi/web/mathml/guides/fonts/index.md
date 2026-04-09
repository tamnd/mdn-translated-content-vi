---
title: Phông chữ cho MathML
short-title: Fonts
slug: Web/MathML/Guides/Fonts
page-type: guide
sidebar: mathmlref
---

Để hiển thị toán học tốt, cần có các phông chữ với độ bao phủ Unicode phù hợp và các tính năng Open Font Format cần thiết.
Trang này mô tả cách người dùng có thể cài đặt các phông chữ toán học như vậy để hiển thị MathML đúng cách trong trình duyệt.

## Hướng dẫn cài đặt

Theo nguyên tắc chung, nên cài đặt cả _Latin Modern Math_ (dùng kiểu [Computer Modern](https://en.wikipedia.org/wiki/Computer_Modern) vốn phổ biến cho công thức toán học) và _STIX Two Math_ (có độ bao phủ Unicode lớn cho các ký tự khoa học). Ở các phần tiếp theo, bạn sẽ tìm thấy hướng dẫn chi tiết để cài đặt các phông chữ này trên nhiều hệ điều hành khác nhau.

### Windows

Cài đặt phông chữ _Latin Modern Math_ và _STIX Two Math_ như sau:

1. Tải xuống [latinmodern-math-1959.zip](https://www.gust.org.pl/projects/e-foundry/lm-math/download/latinmodern-math-1959.zip).
2. Mở tệp ZIP, đi vào thư mục `latinmodern-math-1959` rồi tiếp tục vào thư mục `otf`. Bạn sẽ thấy một tệp phông chữ `latinmodern-math`.
3. Mở tệp phông chữ `latinmodern-math` và nhấn nút **Install**.
4. Tải xuống [static_otf.zip](https://raw.githubusercontent.com/stipub/stixfonts/master/zipfiles/static_otf.zip).
5. Mở tệp ZIP `static_otf.zip`, sau đó đi vào thư mục `static_otf`. Trong các tệp ở đó, bạn sẽ thấy một tệp `STIXTwoMath-Regular`.
6. Mở tệp `STIXTwoMath-Regular` và nhấn nút **Install**. Nếu muốn, bạn cũng có thể làm tương tự với các tệp phông chữ khác trong thư mục đó.

> [!NOTE]
> _Cambria Math_ được cài sẵn trên Windows và thường đảm bảo khả năng hiển thị MathML tương đối tốt.

### macOS

Cài đặt phông chữ _Latin Modern Math_ như sau:

1. Tải xuống [latinmodern-math-1959.zip](https://www.gust.org.pl/projects/e-foundry/lm-math/download/latinmodern-math-1959.zip).
2. Giải nén tệp ZIP, đi vào thư mục `latinmodern-math-1959` rồi vào tiếp thư mục `otf`. Bạn sẽ thấy một tệp phông chữ `latinmodern-math`.
3. Nhấp đúp vào tệp phông chữ `latinmodern-math`, rồi nhấn nút **Install font** trong cửa sổ hiện ra.

> [!NOTE]
> Nếu bạn đang dùng macOS Ventura (phiên bản 13) trở lên, _STIX Two Math_ đã được cài sẵn và bạn có thể bỏ qua các bước bên dưới.

Cài đặt phông chữ _STIX Two Math_ như sau:

1. Tải xuống [static_otf.zip](https://raw.githubusercontent.com/stipub/stixfonts/master/zipfiles/static_otf.zip).
2. Mở tệp ZIP `static_otf.zip`, sau đó đi vào thư mục `static_otf`. Trong các tệp ở đó, bạn sẽ thấy một tệp `STIXTwoMath-Regular.otf`.
3. Mở tệp `STIXTwoMath-Regular.otf` và nhấn nút **Install Font** trong cửa sổ hiện ra. Nếu muốn, bạn cũng có thể làm tương tự với các tệp phông chữ khác trong thư mục đó.

> [!NOTE]
> Một phiên bản cũ đã bị khai tử của _STIX_ được cài sẵn từ OS X Lion (phiên bản 10.7). Mặc dù một số trình duyệt có thể sử dụng nó, bạn vẫn nên làm theo hướng dẫn ở trên để có khả năng hiển thị toán học tối ưu.

### Linux

Bên dưới là các lệnh có thể thực thi trên những bản phân phối Linux phổ biến để cài đặt phông chữ _Latin Modern Math_ và _STIX Two Math_ từ trình quản lý gói. Các cách tiếp cận thay thế cũng được cung cấp nếu bản phân phối Linux của bạn không có gói chuyên dụng cho các phông chữ này.

#### Bản phân phối dựa trên Debian, bao gồm Ubuntu và Mint

```bash
sudo apt-get install fonts-lmodern fonts-stix
```

#### Bản phân phối dựa trên Fedora

```bash
sudo dnf install texlive-lm-math stix-math-fonts
```

#### Bản phân phối dựa trên openSUSE

```bash
sudo zypper install texlive-lm-math stix-fonts
```

#### Arch Linux

```bash
sudo pacman -S otf-latinmodern-math otf-stix
```

#### Các gói TeXLive

Nếu bản phân phối Linux của bạn không cung cấp gói cho phông chữ _Latin Modern Math_ và _STIX_, hãy cân nhắc cài các gói `texlive` chứa phông _Latin Modern Math_ và _XITS_. Ví dụ trên Mageia:

```bash
sudo urpmi texlive-dist texlive-fontsextra
```

Tuy nhiên, rất có thể bạn sẽ cần bảo đảm hệ thống của mình nhận diện được những phông chữ này. Hãy thêm một cấu hình fontconfig `/etc/fonts/conf.avail/09-texlive-fonts.conf` trỏ tới thư mục `opentype` của TeXLive, chẳng hạn:

```xml
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
  <dir>/your/path/to/texmf-dist/fonts/opentype</dir>
</fontconfig>
```

Cuối cùng, thêm tệp cấu hình này vào danh sách vị trí phông chữ của hệ thống rồi tái tạo bộ nhớ đệm fontconfig:

```bash
ln -sf /etc/fonts/conf.avail/09-texlive-fonts.conf /etc/fonts/conf.d/
fc-cache -sf
```

#### Gói upstream

Nếu không có gói nào cho bản phân phối Linux của bạn, hoặc nếu bạn chỉ muốn cài trực tiếp gói upstream, hãy thử cách sau:

1. Tải xuống [latinmodern-math-1959.zip](https://www.gust.org.pl/projects/e-foundry/lm-math/download/latinmodern-math-1959.zip) và [static_otf.zip](https://raw.githubusercontent.com/stipub/stixfonts/master/zipfiles/static_otf.zip).
2. Tạo thư mục `~/.fonts` nếu chưa tồn tại rồi đặt `latinmodern-math.otf` và `STIXTwoMath-Regular.otf` vào thư mục đó.
3. Chạy `fc-cache -f` để tái tạo bộ nhớ đệm fontconfig.

### Android

Bạn phải dùng [tiện ích bổ sung MathML-fonts](https://addons.mozilla.org/en-US/firefox/addon/mathml-fonts/).

Noto Sans Math cung cấp độ bao phủ Unicode tốt cho các ký hiệu toán học và [bố cục toán học](https://github.com/notofonts/math/blob/main/documentation/building-math-fonts/index.md).

### Các hệ thống khác

Trên các hệ thống khác, hãy cân nhắc cài một [phông chữ có bảng MATH](#fonts_with_a_math_table) bằng trình quản lý gói của bạn. Lưu ý rằng các phông chữ này thường được phân phối cùng các bộ TeX như [TeX Live](https://www.tug.org/texlive/), nhưng bạn có thể cần làm theo hướng dẫn riêng để hệ thống nhận diện chúng. Cách cuối cùng là cài [tiện ích bổ sung MathML fonts](https://addons.mozilla.org/en-US/firefox/addon/mathml-fonts/).

## Thiết lập nâng cao

Ở các phần tiếp theo, bạn sẽ tìm thấy một số mẹo hữu ích khác cho việc cài đặt và cấu hình phông chữ cho MathML.

### Ký hiệu chữ cái toán học tiếng Ả Rập

Hiện tại, rất ít phông chữ có glyph phù hợp cho nhóm Arabic Mathematical Alphabetic Symbols. Nếu bạn có khả năng cần các ký tự này, chúng tôi khuyến nghị cài phông _XITS_ hoặc [Amiri](https://aliftype.com/amiri/).

### Cài đặt mà không có quyền quản trị viên

Nếu bạn cần cài phông trên một hệ thống mà không có quyền quản trị viên, lựa chọn dễ nhất là dùng tiện ích bổ sung [MathML-fonts](https://addons.mozilla.org/en-US/firefox/addon/mathml-fonts/). Lưu ý rằng việc dùng tiện ích bổ sung không phải là lựa chọn tối ưu vì nó buộc trình duyệt Gecko của bạn tải một tệp CSS trên mọi trang bạn truy cập cũng như tải Web math fonts trên mọi trang có nội dung MathML.

Một phương án tốt hơn trên các hệ thống UNIX là cài các tệp OTF của [Latin Modern Math](https://www.gust.org.pl/projects/e-foundry/lm-math/download/latinmodern-math-1959.zip) và [STIX](https://github.com/stipub/stixfonts) vào một thư mục phông cục bộ rồi chạy `fc-cache` trên thư mục đó nếu cần. Trên macOS và Linux, các đường dẫn chuẩn lần lượt là `~/Library/Fonts/` và `~/.fonts`.

### Phông chữ có bảng MATH

Thực ra bạn có thể cài bất kỳ [phông OpenType toán học](https://fred-wang.github.io/MathFonts/) nào và dùng chúng để hiển thị MathML. Một số trình duyệt cung cấp cách cấu hình phông mặc định cho MathML trong menu tùy chọn phông chữ. Ngoài ra, bạn có thể thử [tiện ích bổ sung MathML Font Settings](https://addons.mozilla.org/en-US/firefox/addon/mathml-font-settings/).

- [Asana Math](https://www.ctan.org/tex-archive/fonts/Asana-Math/)
- [Cambria Math](https://learn.microsoft.com/en-us/typography/font-list/?FID=360)
- [DejaVu Math TeX Gyre](https://sourceforge.net/projects/dejavu/files/dejavu/)
- [Garamond Math](https://github.com/YuanshengZhao/Garamond-Math)
- [Latin Modern Math](https://www.gust.org.pl/projects/e-foundry/lm-math)
- [Libertinus Math](https://github.com/alerque/libertinus)
- [STIX Math](https://github.com/stipub/stixfonts)
- [TeX Gyre Bonum Math](https://www.gust.org.pl/projects/e-foundry/tg-math/download/index_html#Bonum_Math)
- [TeX Gyre Pagella Math](https://www.gust.org.pl/projects/e-foundry/tg-math/download/index_html#Pagella_Math)
- [TeX Gyre Schola Math](https://www.gust.org.pl/projects/e-foundry/tg-math/download/index_html#Schola_Math)
- [TeX Gyre Termes Math](https://www.gust.org.pl/projects/e-foundry/tg-math/download/index_html#Termes_Math)
- [XITS Math](https://github.com/aliftype/xits/releases)
- [Fira Math](https://github.com/firamath/firamath)
- [GFS Neohellenic Math](https://greekfontsociety-gfs.gr/typefaces/Math)
