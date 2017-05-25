
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WCFServiszaabazo
{
  

    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {

    

        SqlConnection conn = new SqlConnection("Data Source=tcp:83.212.126.172;Initial Catalog=iFE;User ID=sa;Password=iFE2016");
       
        public DataSet Profesorji(out bool queryparam)
        {
                try
            {
                conn.Open();
                //query string
                string query;
                DataSet ds = new DataSet();
                DataTable dr = new DataTable();
                SqlCommand cmd = new SqlCommand();
                SqlDataAdapter SqlDa = new SqlDataAdapter();

                cmd.CommandType = CommandType.TableDirect;
                cmd.CommandText = "dbo.fnDobiVseZaposlene";

                /*
                 *   cmd = new SqlCommand("RETRIEVE_EMPLOYEE", pl.ConnOpen());
                 cmd.Parameters.Add(new SqlParameter("@EMPLOYEENO", employeeNo));
                 cmd.CommandType = CommandType.StoredProcedure;
                 da.SelectCommand = cmd;
                 da.Fill(dt);
                 dataGridView1.DataSource = dt;


                 */
                //Dataset
                //Dataadapter
                queryparam = true;
                return ds;
            }
            catch
            {

                queryparam = false;
                return null;

            }
            finally
            {
                conn.Close();
            }
        }

        public string GetData(int value)
        {
            return string.Format("You entered: {0}", value);
        }

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException("composite");
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }
    }
}
public class SQLServer
{


    SqlConnection cs = new SqlConnection("Data Source=tcp:83.212.126.172;Initial Catalog=iFE;User ID=sa;Password=iFE2016");

    public List<string> ReturnTypeOfStaff()
    {

        List<string> a = new List<string>();
        SqlCommand cmd = new SqlCommand("SELECT iFE.dbo.fnDobiVseTipeZaposlenih", cs);
        SqlDataReader reader;

        cmd.Connection = cs;
        try
        {
            cs.Open();
            reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                var TypeOfStaff = reader.GetString(0);
                a.Add(TypeOfStaff);
            }
        }

        finally
        {
            cs.Close();
        }

        return a;
    }

}