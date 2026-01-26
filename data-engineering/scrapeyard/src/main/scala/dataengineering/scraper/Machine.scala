package dataengineering.scraper

import org.jsoup.Jsoup
import scala.jdk.CollectionConverters.*




object Machine:
  def main(args: Array[String]): Unit =
    val doc       = Jsoup.connect("https://en.wikipedia.org").get()
    val headlines = doc.select("#mp-itn b a").asScala

    headlines.map(_.attr("title")).foreach(println)

    getWebAPIsFromMDN()
    println("Machine started")

  def getWebAPIsFromMDN() =

    val mainDoc  = Jsoup.connect("https://developer.mozilla.org/en-US/docs/Web/API").get()
    val links    = mainDoc.select("h2#interfaces").asScala
    // val links    = mainDoc.select("h2#interfaces").next.select("div.index").select("a").asScala

    println(s"$links")

    println("something")
    // val linkData = links.map { link =>
    //   (link.attr("href"), link.attr("title"))
    // }
    // val article  = linkData.map {
    //   case (url, title) =>
    //     println(s"scrapping $title")
    //     val doc     = Jsoup.connect(s"https://developer.mozilla.org$url").get()
    //     val summary = doc.select("article.main-page-content p").asScala
    //       .headOption
    //       .map(_.text)
    //       .getOrElse("no description")
    // }
    // links.length

// List[A] => List[B
def map[A,B](f: A -> B): List[A] => List[B] =
  a.foreach(f)
end Machine
