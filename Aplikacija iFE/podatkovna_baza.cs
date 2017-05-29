/*
using System.Data.Common;
using System.Runtime.Serialization;
using System.Collections.Generic;
using System.ServiceModel;


namespace Aplikacija_iFE
{
    [ServiceContract]
    public interface IService
    {
        [OperationContract]
        IList<Article> QueryArticle();
    }
    class Servic1 : IService
  
    {
        public string SqlConStr = "Data Source=(local);Initial Catalog=Test;user id={Set your user name};password={Set your password};";

        public IList<Article> QueryArticle()
        {
            List<Article> result = new List<Article>;
            result.Add(new global::Article() { Title = "solata", Text = "solata2" });



            return result;
            }

          
        }
 
    #region SQL SERVER CLASSI
    public class Article
    {
        [DataMember]
        public string Title { get; set; }

        [DataMember]
        public string Text { get; set; }
    }
    #endregion

    class SQLite
    {
    }
    #region SQLite CLASSI

    #endregion


}
*/