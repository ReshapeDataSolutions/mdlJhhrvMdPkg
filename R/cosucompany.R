#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteCache_cosucompany()
deleteCache_cosucompany<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Delete from rds_hrv_src_md_cosucompany_input Where FNumber in(select FNumber from rds_hrv_src_md_cosucompany)")

  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)
}
#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' insertCache_cosucompany()
insertCache_cosucompany <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("Insert into rds_hrv_src_md_cosucompany
    Select * from rds_hrv_src_md_cosucompany_input ")

  res=tsda::sql_insert2(token = token,sql_str = sql)
  return(res)

}

#' 科目更新
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' deleteAllcache_cosucompany()
deleteAllcache_cosucompany <- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("truncate table rds_hrv_src_md_cosucompany_input ")
  res=tsda::sql_delete2(token = token,sql_str = sql)
  return(res)


}
#' 往来单位查询
#'
#' @param token
#'
#' @return 无返回值
#' @export
#'
#' @examples
#' ViewCosucompany()
ViewCosucompany<- function(token='9ADDE293-1DC6-4EBC-B8A7-1E5CC26C1F6C') {
  sql=paste0("SELECT * from rds_hrv_src_md_cosucompany")
  data=tsda::sql_select2(token = token,sql = sql)
  col_selected = c('Fitem','FNumber','FName')
  dataview=data[ ,col_selected]
  dataview$往来单位=data$Fitem

  dataview$往来单位编码=data$FNumber


  dataview$往来单位名称=data$FName


  res=dataview[,c('往来单位','往来单位编码','往来单位名称')]

  return(res)


}
