#import "../utils/custom-cuti.typ": fakebold
#import "../utils/style.typ": 字号, 字体

// 文稿设置，可以进行一些像页面边距这类的全局设置
#let head(
  // documentclass 传入参数
  anonymous: false,
  info: (:),
) = {
  // 1.  默认参数
  info = (
    authors: (
      ("张三",),
    )
  ) + info

  // 2.  对参数进行处理
  // 2.1 如果是字符串，则使用换行符将标题分隔为列表
  if info.title == "" {
    info.title = "适用于日常交流的简易论文模板"
  }

  align(center)[
    #set text(font:字体.黑体, size: 字号.小二)
    #fakebold(info.title)
  ]
  if info.authors.len()>0 and not anonymous {
    // v(1em)
    set par(leading: 0.5em)
    set text(font:字体.宋体,size: 字号.小五)
    align(center)[#{
      if info.authors.len() == 1 {
        let person = info.authors.last()
        grid(
          columns: person.len(),
          gutter: 1em,
          ..person,
        )
      } else {
        grid(
          columns: info.authors.len(),
          gutter: 1em,
          ..info.authors.map(person => {
            for item in person {
              [#item \ ]
            }
          }),
        )
      }
    }]
  }
}